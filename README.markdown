# Writing Maintainable Automated Acceptance Tests

This is the demo code for my demonstration
of how to write maintainable automated acceptance tests.

## Files

**README.markdown**
    : The file you are now reading.

**Rakefile**
    : Commands and utilities for running tests.
    Type **<code>rake -T</code>** to see the commands.

**app**
    : The application being tested.
    **cli.rb** is the command line version.
    **server.rb** is the web version.

**atest**
    : Acceptance tests for the app.
    These are the ugly versions of the tests,
    replete with incidental details and duplication.
    Over the course of the demonstration,
    I show how to improve these tests incrementally,
    making them clearer and more adaptable to change.

**examples**
    : A sampling of the acceptance tests at various
    stages during the demonstration.

**unit**
    : Unit tests for the app.

## See Also

[My article (PDF)](http://dhemery.com/pdf/writing_maintainable_automated_acceptance_tests.pdf)
that walks through the demonstration.

[My blog post](http://cwd.dhemery.com/2009/11/wmaat/)
on the topic, with interesting comments from readers.

[Robot Framework](http://code.google.com/p/robotframework/),
the testing tool I used in the demo.

[Bob Martin's video](http://blog.objectmentor.com/articles/2009/12/07/writing-maintainable-automated-acceptance-tests)
demonstrating the same principles with [FitNesse](http://fitnesse.org/),
another acceptance test automation tool.