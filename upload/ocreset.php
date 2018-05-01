<?php
// Load config
include('config.php');

// Connect to database
mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die('ERROR CONNECTING TO SERVER');
mysql_select_db(DB_DATABASE) or die('ERROR SELECTING TABLE');

// Get list of active adminstrators
$query = "SELECT user_id, username FROM ".DB_PREFIX."user WHERE user_group_id = '1' AND status = '1'";
$result = mysql_query($query);
if(!$result) {
    echo 'ERROR WITH QUERY: '.mysql_error().'<br />';
    die($query);
}
while($r = mysql_fetch_assoc($result)) {
    $users[$r['user_id']] = $r['username'];
}

// Form has been submitted
if(isset($_POST['ID'])) {
    // Clean up password field and make sure it has a value
    $pass = trim($_POST['password']);
    if($pass == '') {
        $info = 'ERROR: Password needed in order to reset';
    }else{
        // Update the table with the new information
        $query = sprintf("UPDATE ".DB_PREFIX."user SET password = '%s' WHERE user_id = '%s'", md5($pass), mysql_real_escape_string($_POST['ID']));
        $result = mysql_query($query);
        if(!$result) {
            $info = 'Could not update the database<br />'.mysql_error();
        }else{
            $info = 'User `'.$users[$_POST['ID']].'` updated successfully!';
        }
    }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Open Cart administrator password reset</title>
<style type="text/css">
<!--
body {font-family: Verdana, Arial, Helvetica, sans-serif; background: #438AB7; color: #ffffff; font-size: 10px;}
.lbl {display: block; text-align: center; width: 200px; font-weight: bold;}
.input {width: 200px;}
.info { border: 2px solid #2B5775; padding: 3px; font-size: 16px; font-weight: bold; text-align: center;}
-->
</style>
</head>

<body>
<?php
if(isset($info)) {
    echo "<div class=\"info\">$info</div>";
}
?>
<h1>Open Cart administrator password reset</h1>
<form id="frmReset" method="post" action="">
  <fieldset style="border: none;">
    <label for="ID" class="lbl">Administrator to reset: </label>
    <select name="ID" id="ID" class="input">
      <?php foreach($users as $id => $username): ?>
      <option value="<?php echo $id; ?>"><?php echo $username; ?></option>
      <?php endforeach; ?>
    </select>
    <label for="password" class="lbl">New password: </label>
    <input type="text" name="password" id="password" class="input" />
  <br />
  <br />
  <input class="lbl" type="submit" name="button" id="button" value="Change password"/>
  </fieldset>
</form>
</body>
</html>