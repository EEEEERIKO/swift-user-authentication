# Swift User Authentication

A simple user registration and login system built with Swift. This project demonstrates fundamental programming and object-oriented concepts, including structures, classes, properties, methods, inheritance, initialization, deinitialization, and basic password hashing.

## Features

* User registration with username, email, and password.
* Unique username validation.
* Basic password transformation for storage.
* User login and credential verification.
* User removal.
* Registered user count.
* Administrator functionality to list all registered users.
* Demonstration of object initialization and deinitialization.

## Technologies

* **Swift**
* **Foundation**

## Project Structure

```text
swift-user-authentication/
└── main.swift
```

## Architecture

### `User`

`User` is a Swift `struct` that represents a registered user.

It contains:

* `username: String` — unique identifier.
* `email: String` — user's email address.
* `passwordHash: String` — transformed password stored instead of the original password.

It also provides:

* `hashPassword(_:)` — transforms the password before storing it.
* `verifyPassword(_:)` — verifies the provided password against the stored value.
* An initializer for creating users.

### `UserManager`

`UserManager` is a class responsible for managing registered users.

It contains:

* `users: [String: User]` — dictionary containing registered users.
* `userCount` — computed property that returns the number of registered users.

Methods:

```swift
registerUser(username:email:password:) -> Bool
```

Registers a new user and prevents duplicate usernames.

```swift
login(username:password:) -> Bool
```

Verifies the user's credentials.

```swift
removeUser(username:) -> Bool
```

Removes a user from the system.

### `AdminUser`

`AdminUser` inherits from `UserManager` and adds administrator-specific functionality.

```swift
listAllUsers() -> [String]
```

Returns a sorted list containing all registered usernames.

The class also implements `deinit` to demonstrate deinitialization:

```swift
deinit {
    print("AdminUser instance has been removed from memory")
}
```

## Password Handling

For this educational exercise, the password is transformed before being stored rather than being saved as plain text.

The implementation uses Swift's `reversed()` functionality:

```swift
static func hashPassword(_ password: String) -> String {
    String(password.reversed())
}
```

For example:

```text
password123
     ↓
321drowssap
```

The transformed value is stored in `passwordHash` and is used when verifying login credentials.

> **Note:** This is a simplified educational implementation and is not a cryptographically secure password hashing algorithm. Production authentication systems should use dedicated password-hashing algorithms such as Argon2id, bcrypt, scrypt, or PBKDF2.

## Swift Concepts Demonstrated

| Concept                 | Implementation                        |
| ----------------------- | ------------------------------------- |
| Structure               | `User`                                |
| Class                   | `UserManager`                         |
| Inheritance             | `AdminUser: UserManager`              |
| Stored property         | `users`                               |
| Computed property       | `userCount`                           |
| Methods                 | Registration, login, removal, listing |
| Initializer             | `init`                                |
| Deinitializer           | `deinit`                              |
| Dictionary              | `[String: User]`                      |
| Optionals               | `guard let`                           |
| Password transformation | `String(password.reversed())`         |

## Requirements

* macOS
* Swift 5+
* Xcode or Swift command-line tools

## Running the Project

Clone the repository:

```bash
git clone https://github.com/EEEEERIKO/swift-user-authentication.git
```

Navigate to the project directory:

```bash
cd swift-user-authentication
```

Run the Swift file:

```bash
swift main.swift
```

If you are using Xcode, open the project and run it from the Xcode environment.

## Example Usage

```swift
let manager = UserManager()

manager.registerUser(
    username: "eriko",
    email: "eriko@example.com",
    password: "password123"
)

manager.login(
    username: "Eriko",
    password: "password123"
)

print(manager.userCount)

manager.removeUser(username: "Eriko")
```

Administrator functionality:

```swift
let admin = AdminUser()

admin.registerUser(
    username: "Eriko",
    email: "eriko@example.com",
    password: "password123"
)

admin.registerUser(
    username: "john",
    email: "john@example.com",
    password: "securePassword"
)

print(admin.listAllUsers())
```

## Learning Objective

The purpose of this project is to apply Swift's fundamental programming concepts by building a small authentication system while practicing structures, classes, properties, methods, inheritance, initialization, deinitialization, collections, and basic password handling.

## Author

**Erik Valencia Cardona**

Systems Engineering Student
