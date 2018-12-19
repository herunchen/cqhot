window.onload = function() {
    var config = {
        id: "tg1",
        width: "800",
        renderTo: "div1",
        headerAlign: "left",
        headerHeight: "30",
        dataAlign: "left",
        indentation: "20",
        folderOpenIcon: "img/folderOpen.png",
        folderCloseIcon: "img/folderClose.png",
        defaultLeafIcon: "img/defaultLeaf.gif",
        hoverRowBackground: "false",
        folderColumnIndex: "1",
        itemClick: "itemClickEvent",
        columns: [{
            headerText: "",
            headerAlign: "center",
            dataAlign: "center",
            width: "20"
        },
            {
                headerText: "名称",
                dataField: "name",
                headerAlign: "center",
                handler: "customOrgName"
            },
            {
                headerText: "拼音码",
                dataField: "code",
                headerAlign: "center",
                dataAlign: "center",
                width: "100",
                hidden: true
            },
            {
                headerText: "负责人",
                dataField: "assignee",
                headerAlign: "center",
                dataAlign: "center",
                width: "100"
            },
            {
                headerText: "查看",
                headerAlign: "center",
                dataAlign: "center",
                width: "50",
                handler: "customLook"
            }],
        data: [
            {
                name: "城区分公司",
                code: "CQ",
                assignee: "",
                children: [{
                    name: "城区卡品分销中心"
                	},
                    {
                        name: "先锋服务厅",
                        children: [{
                            name: "chlid1"
                        },
                            {
                                name: "chlid2"
                            },
                            {
                                name: "chlid3",
                                children: [{
                                    name: "chlid3-1"
                                },
                                    {
                                        name: "chlid3-2"
                                    },
                                    {
                                        name: "chlid3-3"
                                    },
                                    {
                                        name: "chlid3-4"
                                    }]
                            }]
                    },
                    {
                        name: "半环服务厅"
                    }]
            },
            {
                name: "清新分公司",
                code: "QX",
                assignee: "",
                children: []
            },
            {
                name: "英德分公司",
                code: "YD",
                assignee: "",
                children: []
            },
            {
                name: "佛冈分公司",
                code: "FG",
                assignee: "",
                children: []
            }]
    };
//    debugger;
    var treeGrid = new TreeGrid(config);
    treeGrid.show()
}