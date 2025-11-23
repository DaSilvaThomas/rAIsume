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
    public function generateSummary(string $text, int $wordLimit = 50): string
    {
        // On enlève les balises HTML si présentes
        $plain = strip_tags($text);
        // On divise en mots
        $words = preg_split('/\s+/', $plain);
        if (!$words) {
            return '';
        }
        $summaryWords = array_slice($words, 0, $wordLimit);
        return implode(' ', $summaryWords);
    }
}
