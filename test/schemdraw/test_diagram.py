#!/usr/bin/env python3

import schemdraw
from schemdraw import logic

schemdraw.use('svg')

# Test all transitions
def testwave(c):
    return f'{c}0{c}1{c}3{c}u{c}d{c}h{c}l{c}z{c}n{c}p{c}'

d = schemdraw.Drawing()

d += logic.TimingDiagram(
    {'signal': [
        {'name': 'datas', 'wave': 'x=23456789x..........', 'data': '= 2 3 4 5 6 7 8 9'},
        {},
        {'name': 'test', 'wave': '222222222222222222222', 'data': '. 0 . 1 . 3 . u . d . h . l . z . n . p .'},
        {'name': '0', 'wave': testwave('0')},
        {'name': '1', 'wave': testwave('1')},
        {'name': 'z', 'wave': testwave('z')},
        {'name': 'h', 'wave': testwave('h')},
        {'name': 'l', 'wave': testwave('l')},
        {'name': 'd', 'wave': testwave('d')},
        {'name': 'u', 'wave': testwave('u')},
        {'name': 'n', 'wave': testwave('n')},
        {'name': 'p', 'wave': testwave('p')},
        {'name': '5', 'wave': testwave('5')},
        {'name': 'x', 'wave': testwave('x')},
    ]})

d.save('test_diagram.svg')
