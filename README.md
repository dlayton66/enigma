# Enigma

## Functionality

I'm pleased I got through all the functionality of the program, including cracking and CLIs for encrypt, decrypt, and crack.  The most interesting part for me was figuring out how, when cracking, to get from the shift in letters to the actual key.  Jumping up and down from those shifts in 27-number increments was the simplest way I could think of to do that (Enigma#find_key_array).  It feels a little clunky and I really want there to be a more elegant mathematical solution, but I figured that would end up taking me a lot of time to figure out.

## OOP

I chose to go with a module called Arrable with 4 array-centric methods.  I found myself needing to use all these in multiple places throughout the course of this project.  The module methods also translate well to the classes they're included in.  For instance, Arrable has a method called #all which calls the attributes a,b,c,d, and Keys, Offsets, and Shifts all have attributes by those names.

I thought inheritance could also serve a similar function.  Keys, Offsets, and Shifts could all be children to a parent class which specifies that same functionality.

## Ruby Conventions and Mechanics

All in all I feel my code is fairly dry, logical, and readable.  I tried to use helper methods generously to make my code more readable and encapsulated.  I always tried to apply the single responsibility principle and the law of demeter as best I understand them.  Sometimes I struggled though, like at enigma.rb:64.  This feels a little clunky and potentially like stringing too many individual little functionalities together, but I also felt like trying to name and encapsulate those might be even more cumbersome.

## Test Driven Development

I wasn't able to implement mocks and stubs.  I still feel like I don't know them super well and struggle to understand appropriate use cases.  Regardless, I feel good about the testing I did write, and I got up to 100% coverage in SimpleCov.  If there were anything I'd add it would be to test more messages than "hello world" and "hello world end."

One concern I have is the workflow I've settled into doesn't necessarily show I'm writing my tests prior to my methods.  So far I prefer to write a test and then the method for it, and then I combine those two into a single commit like "feat/test: Make #find_key."  I guess I look at it as drying up my commits.  I also seem to be at an appropriate number of commits for my projects, so I have come to really like this kind of commit workflow.  However, I also realize to an outside observer it's indistinguishable from someone writing their methods before their tests, so if that's a problem going forward please let me know.

## Version Control

I had 5 PRs and around 50 commits.  I tried to make my commits largely by test and method.  I tried to make my PRs for large chunks of functionality - encrypt, decrypt, crack, CLI, and one small last one for final tweaks.  I already mentioned this in TDD, but again I'm curious how my commit workflow looks.
