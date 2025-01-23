import $ from 'jquery';
import * as bootstrap from "bootstrap"


// React Components


// "init" Objects
import Sidebar from "../models/Sidebar.js";
import PagesLogin from "../models/PagesLogin.js";
import AreaIndex from "../models/AreaIndex.js";
import ClusterIndex from "../models/ClusterIndex.js";
import BranchIndex from "../models/BranchIndex.js";
import JobLevelIndex from "../models/JobLevel.js";


const hooks = {
  "pages/login": [PagesLogin],
  "admin/areas/index": [AreaIndex],
  "admin/clusters/index": [ClusterIndex],
  "admin/branches/index": [BranchIndex],
  "admin/job_levels/index": [JobLevelIndex]
}

document.addEventListener("DOMContentLoaded", () => { 
  const {route, payload } = JSON.parse($("meta[name='parameters']").attr('content'));
  const authenticityToken = $("meta[name='csrf-token']").attr('content');
  const options = { authenticityToken, ...payload }

  const components = hooks[route];
  if (components) {
    components.forEach((component) => {
      if (typeof component.init === "function") {
        // "init" object
        component.init(options)
      } else {
        // React component
        renderComponent(component, options)
      }
    })
  }
    if(route != "pages/login") {
    // SIDEBAR JS
    Sidebar.init();
  }
});