<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<div class="item1">
    <form action="insert.php" method="POST">
            <p>imie</p><input type="text" name="imie">
            <p>nazwisko</p><input type="text" name="nazwisko">
            <p>tytul</p><input type="text" name="tytul">
            <p>ISBN</p><input type="text" name="ISBN">
            <p></p><input type="submit" name="POST" value='dodaj' class="btnform">            
    </form>
</div>
<div class="item2">
<?php
    $servername="localhost";
    $username="Dawid";
    $password="dawid";
    $dbname="library";

    $conn= new mysqli($servername, $username, $password, $dbname);

    
    

    echo("<form action='insert2.php' method='POST'>");

        $result1 = $conn -> query("SELECT id_autor FROM autorzy ORDER BY id_autor DESC LIMIT 1");

        while($row = $result1 -> fetch_assoc() ){
            echo("<input type='hidden' value='".$row['id_autor']."' name='id_autor'/>");
        }
 
        $result2 = $conn -> query("SELECT id_tytul FROM tytuly ORDER BY id_tytul DESC LIMIT 1");

         while($row = $result2 -> fetch_assoc()){
            echo("<input input type='hidden' value='".$row['id_tytul']."' name='id_tytul'/>");
        }

        echo("<input type='submit' name='POST' value='ODŚWIEŻ TABELE' class='btnref'>");
    echo("</form>");



    $result= $conn->query("SELECT * FROM bibl, autorzy, tytuly WHERE bibl.id_tytul = tytuly.id_tytul AND bibl.id_autor = autorzy.id_autor;");
    
    echo("<h1>TABELKA BIBLIOTEKA</h1>");
    echo("<table class='tabelasql'>");
    echo("<tr class='head'>
        <td>imie</td>
        <td>nazwisko</td>
        <td>delete autor</td> 
        <td>tyul</td> 
        <td>ISBN</td> 
        <td>delete tytul</td>
    </tr>");

    while($wiersz = $result->fetch_assoc()){

        echo("<tr class='son'>");
        echo("<td>" .$wiersz['imie']. "</td><td>" .$wiersz['nazwisko']. "</td><td>
            <form action='deleteaut.php' method='POST'>
            <input type='hidden' name='autor' value='".$wiersz['id_autor']."'>
            <input type='submit' name='POST' value='delete'>
            </form>
            </td>
        <td>" .$wiersz['tytul']. "</td><td>" .$wiersz['ISBN']. "</td><td>
            <form action='delete.php' method='POST'>
            <input type='hidden' name='tytul' value='".$wiersz['id_tytul']."'>
            <input type='submit' name='POST' value='delete'>
            </form>
        </td>");
        echo("</tr>");

    }
    echo("</table>");
    
    $conn->close();
?>
</div>
</div>
</body>
</html>