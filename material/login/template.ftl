<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title><#nested "title"></title>
        <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.ico"/>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>


    <body class="${properties.kcBodyClass!} template">

    <div class="menu-outline"></div>

    <div id="kc-container" class="${properties.kcContainerClass!}">
        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

            <div id="kc-header" class="${properties.kcHeaderClass!}">
                <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}"><#nested "header"></div>
            </div>

            <div class="mdc-dialog">
                <div id="kc-content" class="mdc-dialog__container ${properties.kcContentClass!}">
                    <div id="kc-content-wrapper" class="mdc-dialog__surface ${properties.kcContentWrapperClass!}">

                        <div class="mdc-dialog__content">

                            <#if displayMessage && message?has_content>
                                <div class="${properties.kcFeedbackAreaClass!}">
                                    <div class="alert alert-${message.type}">
                                        <#if message.type = 'success'><span
                                            class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                        <#if message.type = 'warning'><span
                                            class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                        <#if message.type = 'error'><span
                                            class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                        <#if message.type = 'info'><span
                                            class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                        <span class="kc-feedback-text">${message.summary}</span>
                                    </div>
                                </div>
                            </#if>

                            <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                    <#nested "form">
                                </div>
                            </div>

                            <#if displayInfo>
                                <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                                    <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                        <#nested "info">
                                    </div>
                                </div>
                            </#if>

                        </div>
                    </div>
                </div>
            </div>

            <#if realm.internationalizationEnabled>

                <div class="row">
                    <div class="mdc-select mdc-select--no-label mdc-select--with-leading-icon" id="kc-locale">


                        <div class="mdc-select__anchor">
                            <i class="language-icon material-icons mdc-select__icon" tabindex="-1"
                               role="button">language</i>

                            <i class="mdc-select__dropdown-icon"></i>
                            <div class="mdc-select__selected-text">${locale.current}</div>
                            <div class="mdc-line-ripple"></div>
                        </div>

                        <div class="mdc-select__menu mdc-menu mdc-menu-surface mdc-select--no-label">
                            <ul class="mdc-list">
                                <#list locale.supported as l>
                                    <#if l.label = locale.current>
                                        <li class="mdc-list-item mdc-list-item--selected" data-value="${l.url}"
                                            aria-selected="true">${l.label}</li>
                                    <#else>
                                        <li class="mdc-list-item" data-value="${l.url}">${l.label}</li>
                                    </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>

        </div>
    </div>

    </body>
    </html>
</#macro>
