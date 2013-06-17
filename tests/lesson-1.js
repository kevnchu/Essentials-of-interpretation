var assert = require('assert');
var lesson1 = require('../src/lesson-1');
var evaluate = lesson1.evaluate;
var parser = lesson1.parser;

describe('lesson-1', function () {
    describe('addition', function () {
        it('should add two numbers', function () {
            var program = ["+", "1", "3"];
            var result = evaluate(program);
            assert.equal(result, 4);
        });
    });

    describe('subtraction', function () {
        it('should subtract two numbers', function () {
            var program = ["-", "4", "3"];
            var result = evaluate(program);
            assert.equal(result, 1);
        });
    });

    describe('multiplication', function () {
        it('should multiply two numbers', function () {
            var program = ["*", "1", "1"];
            var result = evaluate(program);
            assert.equal(result, 1);
        });
    });

    describe('division', function () {
        it('should divide two numbers', function () {
            var program = ["/", "12", "3"];
            var result = evaluate(program);
            assert.equal(result, 4);
        });
    });

    describe('number', function () {
        it('should evaluate to itself', function () {
            var program = ["3"];
            var result = evaluate(program);
            assert.equal(result, 3);
        });
    });
});
