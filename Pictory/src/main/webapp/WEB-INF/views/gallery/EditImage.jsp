<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pictory Image Editor</title>
    <meta
      name="description"
      content="fuck you image editor"
    />
  <!--vanilla js cdn-->
  <script src="https://scaleflex.cloudimg.io/v7/plugins/filerobot-image-editor/latest/filerobot-image-editor.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap"
      rel="stylesheet"
    />
    <link
    rel="stylesheet"
    href="https://cdn.scaleflex.it/plugins/js-cloudimage-responsive/4.8.5/js-cloudimage-responsive.min.css?vh=a076ef&func=proxy"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="./public/style.css" />
   
  </head>

  <body>
    <section class="content-wrapper">
      <header class="header">
      
      </header>

      <div class="content">
        <div class="img-table container">
          <div id="config-wrapper" class="config-table">
            <h4>Images</h4>
            <div class="img-container">
              <div class="uploaded-imgs-wrapper"></div>
              <input
                class="add-img"
                type="file"
                accept="image/*"
                name="image"
                id="add-image"
              />
            </div>
            <h5>Tabs</h5>
            <div class="tools-checkboxs">
              <div class="tabs-left-column">
                <div class="checkbox-wrapper">
                  <label class="checkbox-container" for="crop">
                    Adjust
                    <input
                      id="crop"
                      value="adjust"
                      type="checkbox"
                      name="Crop"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
                <div>
                  <label class="checkbox-container" for="finetune">
                    Finetune
                    <input
                      id="finetune"
                      value="finetune"
                      type="checkbox"
                      name="Finetune"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
                <div id="filter-wrapper">
                  <label id="filter-label" class="checkbox-container" for="filter">
                    Filters
                    <input
                      id="filter"
                      value="filter"
                      type="checkbox"
                      name="Filters"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
              </div>
              <div class="tabs-right-column">
                <div>
                  <label class="checkbox-container" for="watermark">
                    Watermark
                    <input
                      id="watermark"
                      value="watermark"
                      type="checkbox"
                      name="Watermark"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
                <div id="annotate-wrapper">
                  <label id="annotate-label" class="checkbox-container" for="annotate">
                    Draw
                    <input
                      id="annotate"
                      value="annotate"
                      type="checkbox"
                      name="Annotate"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
                <div>
                  <label class="checkbox-container" for="resize">
                    Resize
                    <input
                      id="resize"
                      value="resize"
                      type="checkbox"
                      name="Resize"
                      checked />
                    <span class="checkmark"></span></label
                  ><br />
                </div>
              </div>
            </div>
            <div class="mode-content">
              <h4>Mode</h4>
              <select id="mode-options">
                <option class="mode-options" value="Download">Download</option>
                <option value="Cloudimage">CloudImage</option>
              </select>
            </div>
          </div>
          <div class="editor-container" id="editor_container">
            <div class="plugin-spinner"></div>
          </div>
        </div>
        <div class="blue-blur-ellipse"></div>
        <div class="cyan-blur-ellipse"></div>
      </div>
    </section>


    <!--<script type="module" src="/public/init.js"></script>-->
    <script src="https://cdn.scaleflex.it/plugins/js-cloudimage-responsive/4.8.5/js-cloudimage-responsive.min.js"></script>
    <script src="https://cdn.scaleflex.it/filerobot/js-cloudimage-responsive/lazysizes.min.js"></script>
    <script>
      const ciResponsive = new window.CIResponsive({
        token: "scaleflex",
        baseURL: "https://scaleflex.cloudimg.io/v7/demo/",
        params: 'org_if_sml=1&version=16.04.2020',
        lazyLoading: true,
        exactSize: false,
        limitFactor: 10,
        apiVersion: 'v7',
        lowQualityPreview: {
          minImgWidth: 180
        }
      });
    </script>

    <script>
      var file = document.querySelector('input[type="file"]');
      console.log(file.getAttribute)

      const reader = new FileReader();
      reader.addEventListener('loadend',()=>{
        console.log(reader.readAsDataURL);
        console.log(reader.error);
      })

    </script>

    
<!--===============================절 취 선 =========================================-->
<script> //git example 여기에 추가했음 헷갈리지말기ㅠ
  const { TABS, TOOLS } = FilerobotImageEditor;
  const config = {

    source: 'https://images.unsplash.com/photo-1656936632096-59fcacae533f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
    onSave: (editedImageObject, designState) =>
      console.log('saved', editedImageObject, designState),
    annotationsCommon: {
      fill: '#ff0000',
    },
    Text: { text: '여기 뭐임??' },
    translations: {
      profile: 'Profile',
      coverPhoto: 'Cover photo',
      facebook: 'Facebook',
      socialMedia: 'Social Media',
      fbProfileSize: '180x180px',
      fbCoverPhotoSize: '820x312px',
    },

    Crop: {
      presetsItems: [
        {
          titleKey: 'classicTv',
          descriptionKey: '4:3',
          ratio: 4 / 3,
          // icon: CropClassicTv, // optional, CropClassicTv is a React Function component. Possible (React Function component, string or HTML Element)
        },
        {
          titleKey: 'cinemascope',
          descriptionKey: '21:9',
          ratio: 21 / 9,
          // icon: CropCinemaScope, // optional, CropCinemaScope is a React Function component.  Possible (React Function component, string or HTML Element)
        },
      ],
      presetsFolders: [
        {
          titleKey: 'socialMedia', // will be translated into Social Media as backend contains this translation key
          // icon: Social, // optional, Social is a React Function component. Possible (React Function component, string or HTML Element)
          groups: [
            {
              titleKey: 'facebook',
              items: [
                {
                  titleKey: 'profile',
                  width: 180,
                  height: 180,
                  descriptionKey: 'fbProfileSize',
                },
                {
                  titleKey: 'coverPhoto',
                  width: 820,
                  height: 312,
                  descriptionKey: 'fbCoverPhotoSize',
                },
              ],
            },
          ],
        },
      ],
    },
    tabsIds: [TABS.ADJUST, TABS.ANNOTATE, TABS.WATERMARK], // or ['Adjust', 'Annotate', 'Watermark']
    defaultTabId: TABS.ANNOTATE, // or 'Annotate'
    defaultToolId: TOOLS.TEXT, // or 'Text'
  };

  // Assuming we have a div with id="editor_container"
  const filerobotImageEditor = new FilerobotImageEditor(
    document.querySelector('#editor_container'),
    config,
  );

  filerobotImageEditor.render({
    onClose: (closingReason) => {
      console.log('Closing reason', closingReason);
      filerobotImageEditor.terminate();
    },
  });

  
  

  </script>
  </body>
</html>
