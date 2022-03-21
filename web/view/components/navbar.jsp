<%-- 
    Document   : navbar
    Created on : 21-03-2022, 15:53:34
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-light bg-light fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
        <svg width="40" height="40" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--! Font Awesome Pro 6.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M523.9 31.1H574C603.4 31.1 628.1 51.99 636.1 80.48L640 95.1L544 119.1V191.1C544 279.1 484.9 354.1 404.2 376.8L446.2 478.9C451.2 491.1 445.4 505.1 433.1 510.2C420.9 515.2 406.9 509.4 401.8 497.1L355.2 383.1C354.1 383.1 353.1 384 352 384H311.1L350.2 478.9C355.2 491.1 349.4 505.1 337.1 510.2C324.9 515.2 310.9 509.4 305.8 497.1L259.2 384H126.1L51.51 441.4C37.5 452.1 17.41 449.5 6.638 435.5C-4.138 421.5-1.517 401.4 12.49 390.6L368 117.2V88C368 39.4 407.4 0 456 0C483.3 0 507.7 12.46 523.9 32V31.1zM456 111.1C469.3 111.1 480 101.3 480 87.1C480 74.74 469.3 63.1 456 63.1C442.7 63.1 432 74.74 432 87.1C432 101.3 442.7 111.1 456 111.1z"/></svg>
        Farm Management
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Farm Management</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link" href="../Flock/Search">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M288 167.2V139.1c-28.25-36.38-47.13-79.29-54.13-125.2C231.7 .4054 214.8-5.02 206.1 5.481C184.1 30.36 168.4 59.7 157.2 92.07C191.4 130.3 237.2 156.7 288 167.2zM400 63.97c-44.25 0-79.1 35.82-79.1 80.08l.0014 59.44c-104.4-6.251-193-70.46-233-161.7C81.48 29.25 63.76 28.58 58.01 40.83C41.38 75.96 32.01 115.2 32.01 156.6c0 70.76 34.11 136.9 85.11 185.9c13.12 12.75 26.13 23.27 38.88 32.77L12.12 411.2c-10.75 2.75-15.5 15.09-9.5 24.47c17.38 26.88 60.42 72.54 153.2 76.29c8 .25 15.99-2.633 22.12-7.883l65.23-56.12l76.84 .0561c88.38 0 160-71.49 160-159.9l.0013-160.2l31.1-63.99L400 63.97zM400 160.1c-8.75 0-16.01-7.259-16.01-16.01c0-8.876 7.261-16.05 16.01-16.05s15.99 7.136 15.99 16.01C416 152.8 408.8 160.1 400 160.1z"/></svg>
                Flock
            </a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M384 128h-128V0L384 128zM256 160H384v304c0 26.51-21.49 48-48 48h-288C21.49 512 0 490.5 0 464v-416C0 21.49 21.49 0 48 0H224l.0039 128C224 145.7 238.3 160 256 160zM64 88C64 92.38 67.63 96 72 96h80C156.4 96 160 92.38 160 88v-16C160 67.63 156.4 64 152 64h-80C67.63 64 64 67.63 64 72V88zM72 160h80C156.4 160 160 156.4 160 152v-16C160 131.6 156.4 128 152 128h-80C67.63 128 64 131.6 64 136v16C64 156.4 67.63 160 72 160zM197.5 316.8L191.1 315.2C168.3 308.2 168.8 304.1 169.6 300.5c1.375-7.812 16.59-9.719 30.27-7.625c5.594 .8438 11.73 2.812 17.59 4.844c10.39 3.594 21.83-1.938 25.45-12.34c3.625-10.44-1.891-21.84-12.33-25.47c-7.219-2.484-13.11-4.078-18.56-5.273V248c0-11.03-8.953-20-20-20s-20 8.969-20 20v5.992C149.6 258.8 133.8 272.8 130.2 293.7c-7.406 42.84 33.19 54.75 50.52 59.84l5.812 1.688c29.28 8.375 28.8 11.19 27.92 16.28c-1.375 7.812-16.59 9.75-30.31 7.625c-6.938-1.031-15.81-4.219-23.66-7.031l-4.469-1.625c-10.41-3.594-21.83 1.812-25.52 12.22c-3.672 10.41 1.781 21.84 12.2 25.53l4.266 1.5c7.758 2.789 16.38 5.59 25.06 7.512V424c0 11.03 8.953 20 20 20s20-8.969 20-20v-6.254c22.36-4.793 38.21-18.53 41.83-39.43C261.3 335 219.8 323.1 197.5 316.8z"/></svg>
                Financial Statements
            </a>
            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
              <li><a class="dropdown-item" href="../Financial_Statements/Insert">Insert</a></li>
              <li><a class="dropdown-item" href="../Financial_Statements/Search">View all Financial Statements record</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../Price/View">
                <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M160 0C177.7 0 192 14.33 192 32V67.68C193.6 67.89 195.1 68.12 196.7 68.35C207.3 69.93 238.9 75.02 251.9 78.31C268.1 82.65 279.4 100.1 275 117.2C270.7 134.3 253.3 144.7 236.1 140.4C226.8 137.1 198.5 133.3 187.3 131.7C155.2 126.9 127.7 129.3 108.8 136.5C90.52 143.5 82.93 153.4 80.92 164.5C78.98 175.2 80.45 181.3 82.21 185.1C84.1 189.1 87.79 193.6 95.14 198.5C111.4 209.2 136.2 216.4 168.4 225.1L171.2 225.9C199.6 233.6 234.4 243.1 260.2 260.2C274.3 269.6 287.6 282.3 295.8 299.9C304.1 317.7 305.9 337.7 302.1 358.1C295.1 397 268.1 422.4 236.4 435.6C222.8 441.2 207.8 444.8 192 446.6V480C192 497.7 177.7 512 160 512C142.3 512 128 497.7 128 480V445.1C127.6 445.1 127.1 444.1 126.7 444.9L126.5 444.9C102.2 441.1 62.07 430.6 35 418.6C18.85 411.4 11.58 392.5 18.76 376.3C25.94 360.2 44.85 352.9 60.1 360.1C81.9 369.4 116.3 378.5 136.2 381.6C168.2 386.4 194.5 383.6 212.3 376.4C229.2 369.5 236.9 359.5 239.1 347.5C241 336.8 239.6 330.7 237.8 326.9C235.9 322.9 232.2 318.4 224.9 313.5C208.6 302.8 183.8 295.6 151.6 286.9L148.8 286.1C120.4 278.4 85.58 268.9 59.76 251.8C45.65 242.4 32.43 229.7 24.22 212.1C15.89 194.3 14.08 174.3 17.95 153C25.03 114.1 53.05 89.29 85.96 76.73C98.98 71.76 113.1 68.49 128 66.73V32C128 14.33 142.3 0 160 0V0z"/></svg>
                Price
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>
<div style="height: 100px" ></div>