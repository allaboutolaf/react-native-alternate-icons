// @flow

import { NativeModules } from 'react-native';
const AlternateIcons = NativeModules.AlternateIcons;

export function setIconName(name: string): Promise<void> {
    return AlternateIcons.setIconName(name);
}

export function reset(): Promise<void> {
    return AlternateIcons.reset();
}

export function getIconName(): Promise<string> {
    return AlternateIcons.getIconName();
}

export function isSupported(): Promise<boolean> {
    return AlternateIcons.isSupported();
}
