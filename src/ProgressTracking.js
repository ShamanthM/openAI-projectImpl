import React, { useEffect, useState } from 'react';
import axios from 'axios';
import base_url from '../api/bootapi';
import { Table, Modal, ModalHeader, ModalBody, ModalFooter, Button, InputGroup, Input, InputGroupText } from 'reactstrap';

const ProgressTracking = () => {
  useEffect(() => {
    document.title = 'Track the task progress';
  }, []);

  const DynamicLabels = () => {
    const [data, setData] = useState([]);

    useEffect(() => {
      // Fetch the data from the database
      fetchData();
    }, []);

    const fetchData = async () => {
      try {
        const response = await axios.get(`${base_url}/app/tasks`);
        setData(response.data);
      } catch (error) {
        console.log(error);
      }
    };

    return (
      <div>
        {data.map((task) => (
          <div key={task.taskNo}>
            <label>Task No: {task.taskId}</label>
            <label>Task Name: {task.taskName}</label>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className='text-center'>
      <h1>Task Tracker</h1>
      <DynamicLabels />
    </div>
  );
};

export default ProgressTracking;
