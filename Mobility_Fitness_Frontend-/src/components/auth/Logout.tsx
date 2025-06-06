import React, { useState, useEffect } from "react";
// import { UsersList } from "../UsersList";
import { API_URL } from "../../constants";
import { log } from "console";


const handleLogout = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const logout = { email, password };
        if (validate()) {
            try {	
                const response = await fetch(`${API_URL}/login`, {
                    method: "DELETE",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify(logout),
                });
                if (response.ok) {
                    const data = await response.json();
                    console.log("Login successful", data);
                } else {
                    console.error("Login failed");
                }
            } catch (err) { 
                console.error("Error:", err);
            }
        }
    };