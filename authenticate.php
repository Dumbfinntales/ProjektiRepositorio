<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once 'config.php';
// Create connection
$conn = new mysqli($servername, $kayttajatunnus, $salasana, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve kayttajatunnus and salasana from POST request
$kayttajatunnus = $_POST['kayttajatunnus'];
$salasana = $_POST['salasana'];

// Hash the salasana
$hashed_salasana =  ($salasana); // You should use a secure hashing algorithm like bcrypt in production

// Query to check user credentials
$sql = "SELECT kayttajaID, rooliID FROM kayttajat WHERE kayttajatunnus = '$kayttajatunnus' AND salasana = '$hashed_salasana'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // User authenticated successfully
    $row = $result->fetch_assoc();
    $kayttajaID = $row['kayttajaID'];
    $rooliID = $row['rooliID'];

    // Optionally, you can fetch the rooli name to include in the response
    $rooli_sql = "SELECT rooli FROM rooli WHERE rooliID = $rooliID";
    $rooli_result = $conn->query($rooli_sql);
    $rooli_row = $rooli_result->fetch_assoc();
    $rooli = $rooli_row['rooli'];

    // Tallenna käyttäjäID istuntoon
    $_SESSION['kayttajaID'] = $kayttajaID;

    // Prepare JSON response
    $response = array(
        "success" => true,
        "message" => "Kirjautuminen onnistui",
        "kayttajaID" => $kayttajaID,
        "rooliID" => $rooliID,
        "rooli" => $rooli
    );
} else {
    // Authentication failed
    $response = array(
        "success" => false,
        "message" => "Virheellinen käyttäjätunnus tai salasana"
    );
}

// Close database connection
$conn->close();

// Send JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>