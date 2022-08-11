# ic-projects
Applications build for the Internet Computer

<p align="center">
  <img src="https://coinpogo.com/wp-content/uploads/2021/05/dfinity-logo-98a97c808e0759059960a3cd68afb5c9.jpg" width="400px" />
</p>

## Requirements
<ul>
  <li>DFX version 0.9.3</li>
  <li>Node version 16.15 (recommended)</li>
  <li>NPM version 8.11 (recommended)</li>
</ul>

### Requirements for windows
<ul>
  <li>Windows 10 or higher (64-bit machine)</li>
  <li>WSL</li>
</ul>

## Create an app and test everything is working
Create Default Hello App
```
$ dfx new hello
```
Simulate the service in your local machine
```
$ dfx start
```
Deploy the canister
```
$ dfx deploy
```
Build the front-end
```
$ npm start
```
You should see your app running at http://localhost:8080/

## Credits
Assets and concepts of the projects provided by [Udemy Course](https://www.udemy.com/course/the-complete-web-development-bootcamp/).
