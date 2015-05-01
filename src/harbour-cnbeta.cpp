/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif
#include <QQuickView>
#include <sailfishapp.h>
#include "newslistretriever.h"
#include "articleretriever.h"
#include "commentretriever.h"
#include "topicretriever.h"
#include "utility.h"

int main(int argc, char *argv[])
{

    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> viewer(SailfishApp::createView());
    qmlRegisterType<NewsListRetriever>("com.yeatse.cnbeta", 1, 0, "NewsList");
    qmlRegisterType<ArticleRetriever>("com.yeatse.cnbeta", 1, 0, "Article");
    qmlRegisterType<CommentRetriever>("com.yeatse.cnbeta", 1, 0, "Comment");
    qmlRegisterType<TopicRetriever>("com.yeatse.cnbeta", 1, 0, "TopicList");

    app->setApplicationName("cnBeta");
    app->setOrganizationName("Yeatse");
    app->setApplicationVersion(VER);
    viewer->rootContext()->setContextProperty("utility", Utility::Instance());
    viewer->setSource(SailfishApp::pathTo("qml/cnBeta/main.qml"));
    viewer->show();
    return app->exec();
}

