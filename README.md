# floward_task

Task give by Floward.

## Project Structure

The project structure is `Clean Architecture`. Please note that, normally, in `Clean Architecture` we would have 2 
folders under `lib`: `features` where the modules are added, and `core` where the services, constants, and other common
files are added. However, in this demo project the scope was too simple to do all of that. So the app was made as one
module where the `presentation`, `domain` and `data` folders are directly under `lib`.

## Native module integration

For integration, I chose the iOS platform. We were adding a native view to our flutter app, so `PlatformView` was used
as our main integration method. I used `MethodChannel` to send the data from the native side to dart, however, for some reason
it just didn't work! That was totally unexpected. I spent an entire hour debugging, but couldn't find where the issue is.
Usually this never gives me trouble. However, it just didn't work...
So this could be considered a KNOWN ISSUE I guess. Typically, in the workplace, I'd give early note when unexpected delays occur,
but I wasn't sure how this would work in this case.

## How API data flows

Just like any typicall `Clean Architecture`. The view model uses a use-case to trigger the logic. Then the use-case calls
a relevant method from the repo. Next, the repo would call the data sources registered to him in order to get the requested model,
which, in our case, is the weather data.

## Important notes

- I have used the network layer I usually use in other projects, so you should expect to find unused files in this demo.
- There's no error handling, since it wasn't required.
- As mentioned above, the final task, which is to send data from native side to dart, is NOT DONE.
- A resources generation script is added to the project. I use this one in all my projects. However, you won't need to use it since,
for this demo, I didn't include the generated files in the .gitignore since this is just a demo.
- fvm was added to the demo. PLease use it to get the proper flutter version to run it.