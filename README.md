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
Simulate IC the service locally
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
You should see your app running at `http://localhost:8080/`

<p align="center">
  <img width="960" alt="image" src="https://user-images.githubusercontent.com/71342016/184196439-9941247c-f83c-4238-918b-c348fcbb0c11.png">
</p>

### Troubleshooting
As of now `dfx@0.9.3` creates a `package.json` with the `webpack-cli: 4.9.x`. Change it to `webpack-cli: 4.10.0` and run `npm install` again to avoid build errors.

### Credits
Assets and concepts of the projects provided by [Udemy Course](https://www.udemy.com/course/the-complete-web-development-bootcamp/).
