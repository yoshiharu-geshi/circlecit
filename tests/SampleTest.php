<?php
namespace PHPTest;

use PHPUnit\Framework\TestCase;

class SampleTest extends TestCase
{
    public function setUp()
    {
        $this->sample = new Sample();
    }

    public function testIsEqual()
    {
        $this->assertEquals(0, $this->sample->getArgv(0));
    }

    public function testIsEmpty()
    {
        $this->assertEmpty($this->sample->getArgv(0));
        $this->assertSame(1, $this->sample->getArgv(1));
        $this->assertNotSame(1, $this->sample->getArgv(0));
        $this->assertTrue($this->sample->getArgv(true));
        $this->assertFalse($this->sample->getArgv(false));
        $this->assertNull($this->sample->getArgv(null));
    }

    public function testMock()
    {
        $stub = $this->createMock(Sample::class);
        // mock なので何を入れてもnull
        $this->assertNotSame(1, $stub->getArgv(0));
        $this->assertNull($stub->getArgv('foo'));
        // return の偽装
        $stub->method('getArgv')->willReturn('foo');
        $this->assertEquals('foo', $stub->getArgv(0));
        //$this->assertEquals('foo', $acctual);
    }

    /**
     * @test
     * @expectedException Exception
     */
    public function getExcaption()
    {
        $this->sample->getException();
    }
}
