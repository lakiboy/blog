<?php

declare(strict_types=1);

namespace App\Twig;

use Twig_Extension;
use Twig_Filter;

final class Extension extends Twig_Extension
{
    public function getFilters(): array
    {
        return [
            new Twig_Filter('obfuscate', [$this, 'obfuscate'], ['is_safe' => ['html' => true]]),
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
