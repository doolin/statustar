/*
 * OpenID Login Box 0.2 - 21st April 2009
 * Copyright(c) 2008, Santosh Rajan
 * Author: Santosh Rajan
 * Email: santrajan@gmail.com
 * License: MIT, GPL
 */

OpenID.openWindow = function(loc) {
    $("body").css({opacity: "0.5"});
    var t = parseInt((window.screen.height - OpenID.config.popupHeight)/2);
    var l = parseInt((window.screen.width - OpenID.config.popupWidth)/2);
    t = (t > 0) ? t : 0;
    l = (l > 0) ? l : 0;
    var opWindow = window.open(
        loc,
        "OPWindow",
        "location=1, scrollbars=1, width=" + OpenID.config.popupWidth +
            ", height=" + OpenID.config.popupHeight + ", top=" + t + ", left=" + l
    );
    $(window).bind("focus", function() {
        setTimeout(function() {
            if (opWindow.closed)
                $("body").css({opacity: "1"});
        }, 200);
    });
};

OpenID.closeWindow = function() {
    $("body").hide();
    window.location = OpenID.config.loggedUserLocation;
};

OpenID.button = function(imagepath, account, loc, ev) {
    return new JX.Container({
        width: 250,
        height: 24,
        click: function(e) {
            e.stopPropagation();
            e.preventDefault();
            jQuery.cookie("defaultID", ev, {expires: 365});
            OpenID.openWindow(loc);
        },
        bind: [
            ev,
            function() {
                this.show();
            }
        ],
        css: {backgroundImage: 'url(images/21.png)', fontSize: '14px', fontWeight: 'bold', cursor: 'pointer'},
        html: '<div style="padding: 1px 0 0 10px"><img src="' + imagepath + '" style="border:0;position:relative;top:3px;"/> ' + account + '</div>',
        scopeThis: true
    })
};

OpenID.getLoginBox = function() {
    var ev;
    var buttons = [];
    var options = '<option value="select">I want to use a different Account</option>';
    for (var i=0; i < OpenID.OPs.length; i++) {
        ev = i + "e";
        buttons.push(OpenID.button(OpenID.OPs[i].imagepath, OpenID.OPs[i].account, OpenID.OPs[i].loc, ev));
        options += '<option value="' + ev + '">' + OpenID.OPs[i].account + '</option>';
    };
    return new JX.Container({
        width: 250,
        css: OpenID.config.loginBoxCSS, 
        onLayout: function() {
            var p = parseInt((this._parent.width() - this.width())/2) + "px";
            this.css({position: 'relative', left: p});
        },
        scopeThis: true,
        items: [{
                    jxtype: 'container',
                    css: {fontWeight: 'bold'},
                    html: 'Sign in with your'
                },{
                    height: 10
                },{
                    jxtype: 'container',
                    bind: [
                        "hideall",
                        function() {
                            for (var i = 0; i < this._items.length; i++)
                                this._items[i].hide();
                        }
                    ],
                    items: buttons,
                    scopeThis: true
                },{
                    css: {fontSize: '11px'},
                    html: "&nbsp;(Opens in a New Window)"
                },{
                    height: 20
                },{
                    jxtype: 'selectfield',
                    width: 250,
                    css: OpenID.config.selectBoxCSS,
                    change: function() {
                        var text = $('option:selected', this).text();
                        var val = this.val();
                        if (val != 'select') {
                            OpenID.LoginBox.trigger("hideall");
                            OpenID.LoginBox.trigger(val);
                        }
                    },
                    scopeThis: true,
                    html: options
                },{
                    height: 20
                },{
                    jxtype: 'container',
                    items: [{
                        jxtype: 'a',
                        attr: {href: ''},
                        css: {fontSize: '13px', fontWeight: 'bold'},
                        click: function(e) {
                            e.stopPropagation();
                            e.preventDefault();
                            OpenID.LoginBox.trigger("shownewaccount");
                        },
                        html: "Help me Sign In"
                    },{
                        hide: null,
                        bind: [
                            "shownewaccount",
                            function() {
                                this.show('slow');
                            }
                        ],
                        css: {fontSize: '13px', backgroundColor: '#cccccc', padding: '5px'},
                        html: OpenID.config.helpMeText,
                        scopeThis: true
            }]
        }]
    });
};

OpenID.initialize = function() {
    var ev = jQuery.cookie("defaultID");
    if (!ev)
        ev = "0e";
    OpenID.LoginBox.trigger("hideall");
    OpenID.LoginBox.trigger(ev);
};

OpenID.LoginBox = OpenID.getLoginBox();
OpenID.initialize();
