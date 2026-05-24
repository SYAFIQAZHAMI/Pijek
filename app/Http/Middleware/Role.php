<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseCode;

class Role
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        if (!$request->user()) {
            return response()->json(['message' => 'Unauthenticated.'], ResponseCode::HTTP_UNAUTHORIZED);
        }

        $userRole = $request->user()->role;

        if (!in_array($userRole, $roles)){
            return response()->json(['message' => 'Forbidden.'], ResponseCode::HTTP_FORBIDDEN);
        }

        return $next($request);
    }
}
