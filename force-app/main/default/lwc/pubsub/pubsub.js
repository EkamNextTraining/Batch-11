const events = {};

const registerListener = (eventName, callback, thisArg) => {
    if (!events[eventName]) {
        events[eventName] = [];
    }

    events[eventName].push({
        callback,
        thisArg
    });
};

const unregisterListener = (eventName, callback, thisArg) => {
    if (!events[eventName]) {
        return;
    }

    events[eventName] = events[eventName].filter(
        listener =>
            listener.callback !== callback ||
            listener.thisArg !== thisArg
    );
};

const fireEvent = (eventName, payload) => {
    if (events[eventName]) {
        events[eventName].forEach(listener => {
            listener.callback.call(
                listener.thisArg,
                payload
            );
        });
    }
};

export {
    registerListener,
    unregisterListener,
    fireEvent
};