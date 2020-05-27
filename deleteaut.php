<?php

    $servername="localhost";
    $username="Dawid";
    $password="dawid";
    $dbname="library";

    $conn= new mysqli($servername, $username, $password, $dbname);

    $autor=$_POST['autor'];

    $sql ="DELETE FROM bibl WHERE id_autor='$autor'";
    $sql2="DELETE FROM autorzy WHERE id_autor='$autor'";

    mysqli_query($conn, $sql);
    mysqli_query($conn, $sql2);

    $conn->close();

    header('Location: http://localhost/php%20library/index.php');

?>