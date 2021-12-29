# FormYoulate

## About

FormYoulate is a very simple app that allows users to either fill out forms that other users have created or create forms that others can fill out.

## Users

FormYoulate is built with very simple and basic user authentication. Users simply need to sign up with a unique username and then give a password and confirmation that is at least 6 characters long.

Once a user is signed up and signed in, they can create their own forms or fill out other user's forms.

At this point there is no options for users to change their username or password.

A user's session is only good until they log out or close their browser.

There are some simple validations around users. If a user attempts to sign in with a bad username/password combo, it will let them know. Also, during signup, it will inform them if they need to make any adjustments.

## Forms

Creating a form is pretty straightforward. Either from a user's home page or from the Forms page a user can navigate to the new form page. From here they will be able to give their form a title, description and add as many questions as they want. Currently the three different types of questions are:

1. Text - open ended question
2. Single Select - Choose one answer (radio inputs)
3. Multi Select - Choose all that apply (checkboxes)

 For a text input, a user only needs to fill in the question, for both the single and multi select, the user needs to give options for other users to choose from. They can continue to add more as needed.

 Currently, once a question is added there is no way to remove it. Same goes for forms. Once it has been created and saved, it cannot be removed or edited.

 Currently there are no validations surrounding forms and fields. A user could easily submit a completely empty form. This is one of the first things I would have worked on given more time.

 The UI for the forms was built with simple Stimulus.js interface.

 Once a user creates a form, they can go to their Home page and see all the forms they have both created and submitted. When they view a form they submitted, it shows them the form in a preview state, but does not allow them to submit it. This is not enforced on the backend.

 If the user owns the form, the form preview page also shows a section where they can view submissions by other users.

 ## Submissions

 Once a user has submitted data on another user's form, they can view their own submission from their Home page. The user who created the form can also view their submission, but other users cannot as of right now. This was an intentional decision. Perhaps it could have been nice to add an option to make submissions private or public.

 ## Tests/Specs

 I did not write a whole lot of tests and decided to just stick with the default Rails testing framework. I tried to write enough tests of different types just to give some variety.

 ## If I had more time

 Here are some things I thought about while working on this that I would have liked to include with more time (not necessarily in order of importance):

1. First, I didn't take the time to optimize any of the queries. I am almost certain that all pages that are loading data from an object and its associations are running N+1.
2. Form validations (as mentioned above)
3. Styling... oh yes styling indeed. It hurts me to have left it in such a raw HTML format. But I did not have the time and didn't feel this at all important for this particular challenge.
4. Flash messages. Currently any action taken by the user does not come with any sort of confirmation.
5. Removing questions while creating a form. It is pretty annoying that if you accidentally add a question, you can't remove it.
6. Save the form without publishing. Allow users to create drafts or in-progress forms.
7. Stats for submissions. An endpoint that would gather the stats on a form as far as how many chose what option.
8. More complex password requirements (if this was going to be a real production app).
9. More robust user system. i.e., email with account confirmation, password reset, etc.
10. Allow users to share forms with others via email or social media.