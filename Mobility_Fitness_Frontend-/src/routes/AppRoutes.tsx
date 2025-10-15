import React from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import {Login} from '../components/auth/Login-Logout';
import Home from '../pages/Home';
import { useAuth } from '../auth/AuthProvider';

const AppRoutes: React.FC = () => {
    const { isAuthenticated } = useAuth();

    return (
        <Router>
            <Routes>
                <Route
                    path="/login"
                    element={isAuthenticated ? <Navigate to="/home" /> : <Login />}
                />
                <Route
                    path="/home"
                    element={isAuthenticated ? <Home /> : <Navigate to="/login" />}
                />
                <Route
                    path="*"
                    element={<Navigate to={isAuthenticated ? "/home" : "/login"} />}
                />
            </Routes>
        </Router>
    );
};

export default AppRoutes;