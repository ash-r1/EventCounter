import React, {
  Reducer,
  useEffect,
  useMemo,
  useReducer,
  useRef,
  useState,
} from 'react';
import { createConsumer } from '@rails/actioncable';

const Counter: React.FC= () => {
  const [number, setNumber] = useState(-1);
  const consumer = useMemo(() => createConsumer(), []);
  const [connected, setConnected] = useState(false);

  const sub = useMemo(() => {
    return consumer.subscriptions.create(
      {
        channel: 'CounterChannel',
      },
      {
        connected() {
          setConnected(true);
        },
        disconnected() {
          setConnected(false);
        },
        received(data) {
          console.log(data)
          setNumber(data)
        },
      }
    );
  }, []);

  useEffect(() => {
    return () => {
      consumer.subscriptions.remove(sub);
    };
  }, []);

  if(!connected){
    return <p>connecting...</p>
  }

  return (
    <p className="counter">{number}</p>
  )
};

export default Counter;
