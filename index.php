<?php 
include('database_connection.php');
if(!isset($_SESSION["user_id"]))
{
    header("location:login.php");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testing Notif Ajax PHP</title>
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h2 align="center">Testing Notif Ajax PHP</h2>
        <br>
        <div align="right">
            <a href="logout.php">Logout</a>
        </div>
        <br>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    Testing - <?php echo $_SESSION['user_name']; ?>
                </a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="label label-pill label-danger count"></span>
                            Notification
                        </a>
                        <ul class="dropdown-menu"></ul>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <form method="post" id="form_wall">
            <textarea name="content" id="content" class="form-control" placeholder="Share anything what's in your mind"></textarea>
            <br>
            <div align="right">
                <input type="submit" name="submit" id="submit" class="btn btn-primary btn-sm" value="Post">
            </div>
        </form>

        <br>
        <br>

        <br>
        <br>
        <h4>Latest Post</h4>
        <br>
        <div id="website_stuff"></div>
    </div>
</body>
</html>

<script>
$(document).ready(function(){

    load_stuff();

    function load_stuff()
    {
        $.ajax({
            url:"load_stuff.php",
            method:"POST",
            success:function(data)
            {
                $('#website_stuff').html(data);
            }
        })
    }
    $('#form_wall').on('submit', function(event){
        event.preventDefault();
        if($.trim($('#content').val()).length == 0)
        {
            alert("Please Write Something");
            return false;
        }
        else
        {
            var form_data = $(this).serialize();
            $.ajax({
                url:"insert.php",
                method:"POST",
                data:form_data,
                success:function(data)
                {
                    if(data == 'done')
                    {
                        $('#form_wall')[0].reset();
                        load_stuff();
                    }
                }
            })
        }  
    });

    $(document).on('click', '.like_button', function(){
        var content_id = $(this).data('content_id');
    $(this).attr('disabled', 'disabled');
    $.ajax({
        url:"like.php",
        method:"POST",
        data:{content_id:content_id},
        success:function(data)
        {
            if(data == 'done')
            {
                load_stuff();
            }
        }
        })
    });

    load_unseen_notification();

    function load_unseen_notification(view = '')
    {
        $.ajax({
            url:"load_notification.php",
            method:"POST",
            data:{view:view},
            dataType:"json",
            success:function(data)
            {
                $('.dropdown-menu').html(data.notification);
                if(data.unseen_notification > 0)
                {
                    $('.count').html(data.unseen_notification);
                }
            }
        })
    }
    $(document).on('click', '.dropdown-toggle', function(){
        $('.count').html('');
        load_unseen_notification('yes');
    });
});



</script>