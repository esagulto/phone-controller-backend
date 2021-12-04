const express = require('express')
const app = express();
const robot = require("robotjs")

const x = robot.getMousePos();
console.log(x);