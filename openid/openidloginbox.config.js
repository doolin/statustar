/*
 * OpenID Login Box 0.2 - 21st April 2009
 * Copyright(c) 2008, Santosh Rajan
 * Author: Santosh Rajan
 * Email: santrajan@gmail.com
 * License: MIT, GPL
 */
 
JX.namespace("OpenID");

//******************* Config options for each OP
OpenID.OPs = [{
    /* The account name you want on the button and select box
     * Dave - Please review dialogue box links below, they are
     * currently broken. May be broken due to missing index.php
     * file? 
     */
    account: "Google Account",
    // The location  to direct the popup when the user clicks the button
    loc: "index.php?openid_identifier=https://www.google.com/accounts/o8/id",
    // A 16X16 px transparent image to be used as the icon on the button
    imagepath: "images/google16.png"
},{
    account: "Yahoo Account",
    loc: "index.php?openid_identifier=yahoo.com",
    imagepath: "images/yahoo16.png"
},{
    account: "myOpenID Account",
    loc: "index.php?openid_identifier=myopenid.com",
    imagepath: "images/myopenid16.png"
}];

//********************* General config options for the login box and popup window
OpenID.config = {
    // The location to redirect the browser when the user is authenticated (logged in)
    loggedUserLocation: "dashboard.php",
    // The width of the popup window
    popupWidth: 800,
    // Height of the popup window
    popupHeight: 500,
    // CSS for the login box. You can adjust padding, backgroundColor here
    loginBoxCSS: {padding: '10px', backgroundColor: '#eeeeee', fontFamily: 'Arial, Helvetica'},
    // CSS for the select box. 
    selectBoxCSS: {borderColor: 'red', fontSize: '13px', fontWeight: 'bold'},
    // Text you want to show when the user clicks "Help me Sign In"
    helpMeText: "You will need one of these accounts. Select an Account you like. Proceed with the Sign In to the Account's site. You can create an Account there."

};
