
# NYTimes

An application to view all latest atricles in the city of NewYork with the publisher name and published dates.



## API Reference

The Archive API returns an array of NYT articles for a given month, going back to 1851.

http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key

To test this API, you can use all-sections for the section path component in the URL above
and 7 for period (available period values are 1, 7 and 30, which represents how far back, in
days, the API returns results for.

For sample-key, please follow the steps mentioned here - 
https://developer.nytimes.com
## Technologies and Architecture

XCode 16.0 or later

Swift UI

MVVM (Model View ViewModel)
## Run Locally

Clone the project

git clone 

Go to the project directory

Hit the run button

No package dependencies required


## Test Coverage

This application provides a test coverage of over 70%.
Scenarios for test cases are being dealt with API responses.

For generating reports - 

Navigate to Test Navigator (CMD + 6)
Jump to ArticleViewModelTest and run the test functions.
Jump to navigation area to see the coverage options with the coverage rate mentioned across each file.

<img width="1156" alt="Screenshot 2024-08-13 at 2 06 26 PM" src="https://github.com/user-attachments/assets/a0dbe94f-3cfd-4876-85e1-0cf45ed80946">
