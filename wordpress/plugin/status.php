<?php
/*
 * Plugin name: Status Star
 * Plugin URI: http://website-in-a-weekend.net/plugins/demo-plugins/
 * Description: Statustar - global status, anytime anywhere (sorta like gravatar, only different).
 * Version: 0.11
 * Author: Dave Doolin
 * Author URI: http://website-in-a-weekend.net/
 */

include('statuswidget.php');

if (!class_exists("statustar")) {

    class statustar {

    	private $tablename = 'statustar';
            
        function statustar() {

            add_action('admin_menu', array(&$this, 'add_status_menu'));
            //register_setting('statustarfoo','statustar-options');
            add_action('admin_init', 'register_options');
            //$this->statustar_init();
            register_activation_hook(__FILE__, array (&$this,'activate'));
            register_deactivation_hook(__FILE__, array (&$this,'deactivate'));
            
        }


        function statustar_init() {
            $options = array('foo' => 'bar', 'baz' => true);
            add_option('statustar-options', $options);
        }
        
        function register_options() {
            register_setting('statustarfoo','statustar-options');
        }
        
        function add_status_menu() {

            if (function_exists('add_menu_page')) {

                add_menu_page('Menu Page Title', 
                              'Menu Title',
                              'administrator', __FILE__, 
                               array(&$this, 'demo_menu_page'),
                               WP_PLUGIN_URL.'/status/award_star_gold_1.ico');

                add_submenu_page(__FILE__, 
                                'Page Title', 
                                'Submenu Title',
                                'administrator', 
                                'submenu_handle', 
                                 array(&$this, 'demo_submenu_page'));
            }
        }

        
        function demo_menu_page() {
            ?>
<div class="wrap">
<h2>Demo Menu Page</h2>
Does nothing but demonstrate menu.</div>
            <?php
        }

        
        function demo_submenu_page() {
            ?>
<div class="wrap">
<h2>Demo Submenu Page</h2>
Does nothing but demonstrate submenu.</div>
            <?php
        }

        function activate() {
            $this->create_table();
        }
        
        function deactivate() {
            delete_option('statustar-options');
            $this->drop_table();
        }
        
        function create_table() {
        
            global $wpdb;
        
            $table_name = $wpdb->prefix.$this->tablename;
            if ($wpdb->get_var("show tables like '$table_name'") != $table_name) {
        
                $sql = "CREATE TABLE ".$table_name." (
                    user text NOT NULL,
                    status text NOT NULL,
        	        id mediumint(9) NOT NULL AUTO_INCREMENT,
        	        message text NOT NULL,
        	        UNIQUE KEY id (id)
        	        );";
        
                require_once (ABSPATH.'wp-admin/includes/upgrade.php');
                dbDelta($sql);        
            }
                        
            $status = 'G';
            $dbdata = array('user' => 'dave', 'status' => $status, 'id' => 13, 'message' => 'Blah blah');
            $wpdb->insert($wpdb->prefix . $this->tablename, $dbdata);
            //$wpdb->insert($this->tablename, $dbdata);
        }

        
        /* find a plugin to use for an example for deleting 
         * database on uninstall.
         */
        function drop_table($plugin) {
        	
            global $wpdb;
            $wpdb->query("DROP TABLE {$wpdb->prefix}".$this->tablename);
        }
        
    }
    
}

$wpdpd = new statustar();
$wpdpd->statustar_init();


?>