<?php

$css_url = WP_PLUGIN_URL.'/status/css/statuswidget.css';
$css_file = WP_PLUGIN_DIR.'/status/css/statuswidget.css';

if (file_exists($css_file)) {
	wp_register_style('sw_stylesheet', $css_url);
	wp_enqueue_style('sw_stylesheet');
}

$formurl = WP_PLUGIN_URL.'/status/statusform.php';
include($formurl);

if (!class_exists("status_widget")) {

	class status_widget extends WP_Widget {

		private $tablename ='wp_statustar';
			
		function status_widget($table_name) {
			$widget_ops = array('classname' => 'widget_rss_links', 'description' => 'Your Global Status' );
			$this->WP_Widget('rss_links', 'Status Star', $widget_ops);
			//$this->tablename = $table_name;
		}


		/* This is the code that gets displayed on the UI side,
		 * what readers see.
		 */
		function widget($args, $instance) {

			global $formurl;

			extract($args, EXTR_SKIP);

			echo $before_widget;
			$title = empty($instance['title']) ? '&nbsp;' : apply_filters('widget_title', $instance['title']);
			$entry_title = empty($instance['entry_title']) ? '&nbsp;' : apply_filters('widget_entry_title', $instance['entry_title']);

			if (!empty($title)) {
				echo $before_title . $title . $after_title;
			}
			?>

<form
	name="statusform" method="POST"><?php			

	if(isset($_POST['submitted']) && $_POST['submitted'] == 1)  {

		$username = $instance['entry_title'];

		if ( is_user_logged_in() ) {

			global $current_user;
			get_currentuserinfo();
			echo 'login Username: ' . $current_user->user_login . "\n";

			if ($current_user->user_login == $username) {

				echo "$username's global status ".$_POST['status'];
				global $wpdb;

				$status = $_POST['status'];
				//$message = $_POST['message'];
				$dbdata = array('user' => 'dave', 'status' => $status, 'id' => 13, 'message' => 'Blah blah');
				$wpdb->update($this->tablename, $dbdata, array('user' => 'dave')); //, array('%s', '%d'), array('%d'));
			}
		} else {
			echo 'Welcome, visitor!';
		}

	}
    //Need to do a database call right here to get the status.  
    // if (!$status) {
    //   $status = db->get_status( where user == $username);
    // }
	?>


<ul class="statustar">
	<li style="background-color: red;"><input type="radio"
		onclick="statusform.submit();" name="status" value="R"
		<?php if ($status == 'R') echo "checked" ?>> R</li>
	<li style="background-color: yellow;"><input type="radio"
		onclick="statusform.submit();" name="status" value="Y"
		<?php if ($status == 'Y') echo "checked" ?>> Y</li>
	<li style="background-color: green;"><input type="radio"
		onclick="statusform.submit();" name="status" value="G"
		<?php if ($status == 'G') echo "checked" ?>> G</li>
</ul>
<input type="hidden" name="submitted" value="1"> <!-- input type="submit" name="save" value="Save Status &raquo;" / -->
</form>

		<?php
		echo $after_widget;
		}




		function update($new_instance, $old_instance) {
			$instance = $old_instance;
			$instance['title'] = strip_tags($new_instance['title']);
			$instance['entry_title'] = strip_tags($new_instance['entry_title']);
			return $instance;
		}

		/* Back end, the interface shown in Appearance -> Widgets
		 * administration interface.
		 */
		function form($instance) {
			$instance = wp_parse_args( (array) $instance, array( 'title' => '', 'entry_title' => '', 'comments_title' => '' ) );
			$title = strip_tags($instance['title']);
			$entry_title = strip_tags($instance['entry_title']);
			?>

<p><label for="<?php echo $this->get_field_id('title'); ?>">Title: <input
	class="widefat" id="<?php echo $this->get_field_id('title'); ?>"
	name="<?php echo $this->get_field_name('title'); ?>" type="text"
	value="<?php echo attribute_escape($title); ?>" /></label></p>


<p><label for="<?php echo $this->get_field_id('entry_title'); ?>"> User
name for status display: <input class="widefat"
	id="<?php echo $this->get_field_id('entry_title'); ?>"
	name="<?php echo $this->get_field_name('entry_title'); ?>" type="text"
	value="<?php echo attribute_escape($entry_title); ?>" /> </label></p>

			<?php
		}
	}

	/* This code probably ought to be moved into calling
	 * file or class or function when this class isn't
	 * being used standalone.
	 */
	function status_widget_init() {
		register_widget('status_widget');
	}

	add_action('widgets_init', 'status_widget_init');

}

?>