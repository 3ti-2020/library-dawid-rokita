<?php
    $servername="localhost";
    $username="Dawid";
    $password="dawid";
    $dbname="library";

    $conn= new mysqli($servername, $username, $password, $dbname);

    $autor=$_POST['id_autor'];
    $tytul=$_POST['id_tytul'];

    $sql="INSERT INTO bibl (id_autor, id_tytul) VALUES ('$autor', '$tytul')";

    mysqli_query($conn, $sql);

    $conn->close();

    header('Location: http://localhost/php%20library/index.php');
?>