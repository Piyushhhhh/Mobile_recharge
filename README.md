# Mobile Recharge App

## Overview
The app enables users to manage their top-up beneficiaries and execute top-up transactions for their UAE phone numbers.

## Features
- **Add Beneficiaries**: Users can add up to 5 active top-up beneficiaries.
- **View Beneficiaries**: Users can view existing beneficiaries in a horizontal list view with cards.
- **Top-Up Options**: Available top-up options include AED 5, AED 10, AED 20, AED 30, AED 50, AED 75, and AED 100.
- **Top-Up Limitations**: 
  - Verified users can top up a maximum of AED 1,000 per calendar month per beneficiary.
  - Unverified users can top up a maximum of AED 500 per calendar month per beneficiary.
  - Users can top up multiple beneficiaries but are limited to a total of AED 3,000 per month for all beneficiaries.
  - A charge of AED 1 is applied for every top-up transaction.
- **User Balance**: The user's balance is debited before attempting the top-up transaction, ensuring the top-up amount does not exceed the user's balance.

## Project Structure
- `lib/`: Contains the main source code for the application.
  - `controllers/`: Contains the provider for managing beneficiaries.
  - `models/`: Contains the data models used in the application.
  - `pages/`: Contains the UI pages of the application.
  - `values/`: Contains the constants and common widgets used in the application.
- `test/`: Contains the unit tests for the application.

## Getting Started

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor (e.g., Visual Studio Code, Android Studio)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Piyushhhhh/Mobile_recharge/

### Code Highlights
## topUpBeneficiary Function

The `topUpBeneficiary` function is responsible for topping up a beneficiary's account. It ensures that the top-up amount does not exceed the monthly limit based on the beneficiary's verification status, and that there are sufficient funds to cover the top-up and a fee of 1 unit.

```dart
void topUpBeneficiary(String phoneNumber, double amount) {
  final beneficiary =
      _beneficiaries.firstWhere((b) => b.phoneNumber == phoneNumber);
  if ((beneficiary.monthlyTopUp + amount <= 1000.0 &&
          !beneficiary.isVerified) ||
      (beneficiary.monthlyTopUp + amount <= 500.0 &&
          beneficiary.isVerified)) {
    if (_balance >= amount + 1) {
      _balance -= (amount + 1);
      beneficiary.monthlyTopUp += amount;
      saveToPrefs();
      notifyListeners();
    }
  }
}
```
## Screenshots

Here are some screenshots of the app:

### Recharge/Top up
<img src="https://github.com/Piyushhhhh/Mobile_recharge/blob/main/assets/screenshots/top_up.png" height="700" >

### Beneficiary Details
 <img src="https://github.com/Piyushhhhh/Mobile_recharge/blob/main/assets/screenshots/beneficiary_detail.png" height="700" >

### Add Beneficiary
<img src="https://github.com/Piyushhhhh/Mobile_recharge/blob/main/assets/screenshots/add_beneficiary.png" height="700" >

## Demo Video

Watch the demo video to see the app in action:

You can watch the demo video of the Mobile Recharge App [here](https://github.com/Piyushhhhh/Mobile_recharge/blob/main/assets/demo_video/demo.mp4).


