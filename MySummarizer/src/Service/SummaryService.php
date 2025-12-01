<?php
namespace MySummarizer\Service;

class SummaryService
{
    /**
     * Génère un résumé (les 50 premiers mots) d’un texte donné.
     *
     * @param string $text
     * @param int $wordLimit
     * @return string
     */
    public function generateSummary(string $text): string
    {    
        $apyToken = 'APY04yQjQCle4BiHGatNS8uMW3Oo2JEzWKxyTFWVpMdw3GmqEJa9qqO2LojQ0Oa4QYcTZH1BwGUi0A';
        $summary = '';

        $url = 'https://api.apyhub.com/ai/summarize-text';

        $payload = json_encode([
            "text" => $text,
            "output_language" => "fr",
        ]);

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'apy-token: ' . $apyToken,
            'Content-Type: application/json'
        ]);
        // En local / WAMP, si SSL pose problème :
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        $resp = curl_exec($ch);
        if ($resp === false) {
            $summary = 'Erreur cURL : ' . curl_error($ch);
        } else {
            $data = json_decode($resp, true);
            if (!empty($data['data']['summary'])) {
                $summary = $data['data']['summary'];
            } else {
                $summary = "Réponse inattendue : " . htmlspecialchars($resp);
            }
        }
        curl_close($ch);

        return $summary;
    }
}