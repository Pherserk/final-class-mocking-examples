<?php

namespace pherserk\FinalClassMockingExamples\test;

use pherserk\FinalClassMockingExamples\AllowedSimpleFinalClass;
use pherserk\FinalClassMockingExamples\NotAllowedSimpleFinalClass;
use PHPUnit\Framework\TestCase;
use Prophecy\Exception\Doubler\ClassMirrorException;

/**
 * Class FinalClassMockingExampleTest
 * @package pherserk\FinalClassMockingExamples\test
 */
class FinalClassMockingExampleTest extends TestCase
{
    public function testAllowedFinalClassCanBeMocked()
    {
        static::prophesize(AllowedSimpleFinalClass::class);

        static::expectNotToPerformAssertions();
    }

    public function testNotAllowedFinalClassCannotBeMocked()
    {
        static::expectException(ClassMirrorException::class);

        static::prophesize(NotAllowedSimpleFinalClass::class);
    }
}
