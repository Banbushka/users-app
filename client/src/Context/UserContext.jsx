import React, { createContext, useState, useEffect } from "react";
import axios from "axios";

const backendUrl = process.env.SERVER_URL;
const UserContext = createContext();


const UserProvider = ({ children }) => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    getUsers();
  }, []);

  const getUsers = async () => {
    try {
      const response = await axios.get("${backendUrl}/api/users");
      setUsers(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  const getUser = async (id) => {
    try {
      const response = await axios.get(`${backendUrl}/api/users/${id}`);
      return response.data;
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <UserContext.Provider value={{ users, getUser }}>
      {children}
    </UserContext.Provider>
  );
};

export { UserContext, UserProvider };