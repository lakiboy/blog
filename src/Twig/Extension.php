<?php

declare(strict_types=1);

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

final class Extension extends AbstractExtension
{
    public function getFilters(): array
    {
        return [
            new TwigFilter('obfuscate', [$this, 'obfuscate'], ['is_safe' => ['html' => true]]),
        ];
    }

    public function obfuscate(string $email, bool $mailto = false): string
    {
        $source = ($mailto ? 'mailto:' : '') . $email;
        $result = '';

        for ($i = 0, $len = strlen($source); $i < $len; ++$i) {
            $result .= '&#x' . dechex(ord($source[$i])) . ';';
        }

        return $result;
    }
}
