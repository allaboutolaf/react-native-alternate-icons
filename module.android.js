// @flow

export function setIconName(name: string): Promise<void> {
    return Promise.reject(new Error('Alternate icons are not supported on Android'));
}

export function reset(): Promise<void> {
    return Promise.reject(new Error('Alternate icons are not supported on Android'));
}

export function getIconName(): Promise<string> {
    return Promise.reject(new Error('Alternate icons are not supported on Android'));
}

export function isSupported(): Promise<boolean> {
    return Promise.resolve(false);
}
