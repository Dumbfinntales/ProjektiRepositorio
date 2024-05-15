<?php
// Include the TCPDF library
require_once('tcpdf/tcpdf.php');

// Fetch data from the database
include 'php/conn.php';

try {
    $sql = "SELECT k.*, t.etunimi AS tyontekija_etunimi, t.sukunimi AS tyontekija_sukunimi
    FROM kasittely k
    JOIN tyontekija t ON k.tyontekijaID = t.tyontekijaID
    WHERE k.valmispvm IS NOT NULL";
    $stmt = $yhteys->query($sql);
    $entries = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Virhe haettaessa vikailmoituksia: " . $e->getMessage();
    die();
}

// Create new PDF instance
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// Set document information
$pdf->SetCreator('R.Autio Oy');
$pdf->SetAuthor('R.Autio Oy');
$pdf->SetTitle('Vikailmoitukset');
$pdf->SetSubject('Vikailmoitukset');
$pdf->SetKeywords('PDF, Vikailmoitukset, Raportti');

// Set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

// Set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// Set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// Set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// Set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// Set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// Set font
$pdf->SetFont('helvetica', '', 12);

// Add a page
$pdf->AddPage();

// Set content
$html = '<h1>Vikailmoitukset</h1>';

$html .= '<table border="1" cellpadding="5">
            <tr>
              <th>Kohde</th>
              <th>Viesti</th>
              <th>Toimenpide</th>
              <th>Ilmoituspvm</th>
              <th>Valmispvm</th>
              <th>Kuittaus</th>
              <!-- Lisää tähän otsikoita, jos tarvii lisää -->
            </tr>';

foreach ($entries as $entry) {
    $html .= '<tr>';
    $html .= '<td>' . $entry['kohde'] . '</td>';
    $html .= '<td>' . $entry['viesti'] . '</td>';
    $html .= '<td>' . $entry['toimenpide'] . '</td>';
    $html .= '<td>' . $entry['pvm'] . '</td>';
    $html .= '<td>' . $entry['valmispvm'] . '</td>';
    $html .= '<td>' . $entry['tyontekija_etunimi'] . ' ' . $entry['tyontekija_sukunimi'] . '</td>';
    // tähän lisätään mitä halutaan tietokannasta näyttää
    $html .= '</tr>';
}

$html .= '</table>';

// Write the HTML content to the PDF
$pdf->writeHTML($html, true, false, true, false, '');

// Close and output PDF document
$pdf->Output('vikailmoitukset.pdf', 'I');