import React, {
  Reducer,
  useEffect,
  useMemo,
  useReducer,
  useRef,
  useState,
} from 'react';
import { createConsumer } from '@rails/actioncable';

interface Props {
  count: string;
}


const Chat: React.FC<Props> = (props) => {
  const count = parseInt(props.count)
  return (
    <p>{count}</p>
  )
};

export default Chat;
