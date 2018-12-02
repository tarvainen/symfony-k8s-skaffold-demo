<?php
declare(strict_types = 1);

namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class DefaultController
 *
 * @package App\Controller
 *
 * @Route(path="/")
 */
class DefaultController
{
    /**
     * @Route(methods={"GET"}, path="healtz")
     *
     * @return JsonResponse
     */
    public function healthAction(): JsonResponse
    {
        return new JsonResponse(['status' => 'ok']);
    }
}