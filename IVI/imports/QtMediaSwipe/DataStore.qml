pragma Singleton
import QtQuick.Studio.Utils
JsonListModel {
    id: models
    source: "models.json"
    property JsonData backend: JsonData {
    }
    property ChildListModel book: ChildListModel {
        modelName: "book"
    }
}