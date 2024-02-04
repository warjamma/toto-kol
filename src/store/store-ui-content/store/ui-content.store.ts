import { observable } from 'mobx';
import { createStore } from 'satcheljs';
import { IUIContentStore } from './ui-content.type';
import { CONFIGURATION } from '@constants/index';
import { LocalStorageService } from "../../../configuration/local-storage";

const initStore: IUIContentStore = {
  contents: observable.map(),
  versions: LocalStorageService.getItem(CONFIGURATION.UI_CONTENT_VERSIONS_LS_KEY, false) || {},
  errors: observable.map(),
};

export const getStore = createStore('UIContentStore', initStore);
