import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return (
        <div>
            I'm a sub section page within the app.
            <Link to="/">Go back home</Link>
        </div>
    );
};