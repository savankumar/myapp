# HRMS Application Blueprint

## Overview

This document outlines the plan for building a Human Resource Management System (HRMS) mobile application using Flutter. The application will include features for authentication, employee check-in/out with location tracking, profile management, and password changes.

## Features

### 1. Authentication
- **Login Page:** A screen where users can enter their username and password.
- **API Integration:** The login process will be handled by a dummy API call.
- **State Management:** The user's authentication state will be managed throughout the application.

### 2. Dashboard
- **Check-in/Check-out:** A button to allow users to check in and out.
- **Geolocation:** The application will capture the user's latitude and longitude upon check-in/out.
- **Geofencing:** The application will include a geofencing feature to ensure users are within a specific area when they check in or out.
- **API Integration:** Check-in/out data will be sent to a dummy API.

### 3. Profile Management
- **Profile Page:** A screen to display user profile information.
- **Profile Picture Update:** A feature to allow users to update their profile picture.
- **Change Password:** A button to navigate to a separate page for changing the password.

### 4. Change Password
- **Change Password Page:** A dedicated screen for users to change their password.
- **API Integration:** The password change will be handled by a dummy API call.

## Technical Plan

- **State Management:** `provider`
- **Routing:** `go_router`
- **UI:** Material Design 3 with `google_fonts`
- **Location Services:** `geolocator` and `geofence_flutter`
- **Image Handling:** `image_picker`
- **API Calls:** `http`
