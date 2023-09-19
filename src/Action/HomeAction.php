<?php

declare(strict_types=1);

namespace App\Action;

use Psr\Http\Message\ResponseFactoryInterface;
use Psr\Http\Message\ResponseInterface;

final class HomeAction
{
    public function run(ResponseFactoryInterface $responseFactory): ResponseInterface
    {
        $response = $responseFactory->createResponse();

        $response->getBody()->write(
            'change from ec2-docker-volume branch' . '<br>' . 'nix just rock with ' . '<strong>' . 'Linux' . '</strong>'
        );

        return $response;
    }
}
