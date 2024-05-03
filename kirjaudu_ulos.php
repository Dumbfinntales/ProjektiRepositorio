<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once 'config.php';

// Tarkista onko käyttäjä kirjautunut sisään
if(isset($_SESSION['kayttajaID'])) {
    // Jos käyttäjä on kirjautunut sisään, poista istuntotiedot ja ohjaa käyttäjä kirjautumissivulle
    session_destroy();
    header("Location: index.php"); // Ohjaa käyttäjä kirjautumissivulle
    exit();
} else {
    // Jos käyttäjä ei ole kirjautunut sisään, ohjaa käyttäjä kirjautumissivulle
    header("Location: yhteydenotto.php"); // Ohjaa käyttäjä kirjautumissivulle
    exit();
}
?>