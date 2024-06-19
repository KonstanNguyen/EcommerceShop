# [Ecommerce Shop](#ecommerce-shop) <a id="ecommerce-shop"></a>

## [Table of Contents](#table-of-contents) <a id="table-of-contents"></a>

- [Tables of Contents](#table-of-contents)

- [Instruction](#introduction)

- [Structure](#structure)

- [Featured](#feature)

- [Prerequisites](#prerequisites)

- [Utilization](#utilization)

- [Contributors](#contributors)

## [Introduction](#introduction) <a id="introduction"></a>

- Nhóm mình có ý tưởng xây dựng một trang web thương mại điện tử tương tự như [Phong Vu](https://phongvu.vn/c/laptop), [Amazon](https://www.amazon.com/),...

- Mục đích là tận dụng lại database đã có từ môn CSDL của kỳ trước để làm thành một sản phẩm

- Nhưng vì vấn đề CSDL nên đề tài này chỉ tập trung vào bán laptop là chính

- Trong quá trình thiết kế thì mình muốn làm giống thực tế (có quản lý kho trong trang admin) nhưng quỹ thời gian gian có hạn nên nhóm thống nhất bỏ bớt vì vậy có kha khá thứ được bỏ đi, ngoài ra còn 1 số thứ vì đã có data nên nhóm không thể sửa lại tên cho chuẩn chỉ hơn. Ví dụ như Category trong database chính là Product ở một số đường dẫn url.

## [Structure](#structure) <a id="structure"></a>

    ├───database
    └───src
        └───main
            ├───java
            │   └───com
            │       └───ecommerce
            │           ├───bean (Chứa các đối tượng chung)
            │           ├───consts
            │           ├───controller
            │           ├───dao
            │           │   └───impl
            │           ├───dto
            │           │   ├───request
            │           │   └───response
            │           ├───entity      (Các thực tể liên kết với database)
            │           ├───error       (Các ngoại lệ - exception)
            │           ├───interceptor (Phân quyền người dùng - ở mức độ cơ bản)
            │           └───service
            │               └───impl
            ├───resources
            └───webapp
                ├───assets
                │   ├───css
                │   │   └───admin
                │   ├───fonts
                │   ├───icons
                │   ├───img
                │   │   └───admin
                │   ├───js
                │   │   ├───dashboard
                │   │   └───plugins-init
                │   └───vendor
                ├───META-INF
                └───WEB-INF
                    ├───configs
                    ├───lib
                    └───views
                        ├───admin
                        │   └───layout
                        ├───elements
                        │   └───footer
                        ├───home
                        │   ├───elements
                        │   │   └───section-top-selling
                        │   └───pages
                        ├───job
                        └───pages

## [Features](#feature) <a id="feature"></a>

Trang web này có những chức năng cơ bản gồm:

- Người dùng: 
    - Giao diện hiện thị cho người dùng.
    - Tìm kiếm sản phẩm.
    - Đăng nhập, đăng ký.
    - Tìm kiếm theo sản phẩm.
    - Lọc sản phẩm theo hãng.
    - Trang thông tin người dùng.
- Admin:
    - Giao diện cho người quản trị viên.
    - Tạo xem báo số lượng đơn hàng.
    - Quản lý thống tin sản phẩm, khuyến mãi,...
- Tính năng thêm:
    - Phân quyền, khôi phục mật khẩu.

## [Prerequisites](#prerequisites) <a id="prerequisites"></a>

1. Eclipse IDE - [Phiên bản mình dùng](https://www.eclipse.org/downloads/packages/release/2023-12/r)
2. SQL Server - Mình dùng 2 phiên bản 2014 và 2020 đều chạy được
    - [SQL Server 2014](https://www.microsoft.com/en-US/download/details.aspx?id=42299&msockid=04d8af2cbbe66cb01921bb73baf46da1) (Chọn bản MgmtStudio 64BIT\SQLManagementStudio_x64_ENU.exe)
    - [SQL Server 2020](https://www.microsoft.com/en-us/sql-server/sql-server-downloads?msockid=04d8af2cbbe66cb01921bb73baf46da1)
3. Tomcat Server: Nhóm mình dùng đồng thời phiên bản 8.5 và 9.0 không có sự khác biệt là mấy (Nhưng phải config lại trong eclipse)
    - [v8.5](https://tomcat.apache.org/download-80.cgi)
    - [v9.0](https://tomcat.apache.org/download-90.cgi)
    
    **Nếu trong nhóm dùng đồng thời 2 phiên bản trên thì vào Eclipse và thực hiện như sau**
    
    *Chuột phải vào Project của bạn -> Properties -> Java Build Path -> Libraries -> Server Runtime -> Chọn phiên bản Tomcat tương ứng của bạn.*

## [Utilization](#utilization) <a id="utilization"></a>

## [Contributors](#contributors) <a id="contributors"></a>

<table>
    <tr>
        <th>Name</th>
        <th>Avatar</th>
        <th>Link Github</th>
        <th>Effect</th>
    </tr>
    <tr>
        <td>Nguyễn Thị Huyền My</td>
        <td><img title="huyenmy239-avatar" style="width:30pt; height: auto; align:center; border:solid" src="https://avatars.githubusercontent.com/u/92309591?v=4"/></td>
        <td><a href="https://github.com/huyenmy239">huyenmy239</a></td>
        <td>
            <ul>
                <li>Thiết kế giao diện trang admin.</li>
                <li>Thiết kế CSDL.</li>
                <li>Kiểm lỗi cho team.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Vũ Thị Thanh Thùy</td>
        <td><img title="thanhthuyne2211-avatar" style="width:30pt; height: auto; align:center; border:solid" src="https://avatars.githubusercontent.com/u/120545208?v=4"/></td>
        <td><a href="https://github.com/thanhthuyne2211">thanhthuyne2211</a></td>
        <td>
            <ul>
                <li>Tạo trang checkout.</li>
                <li>Hiện thị danh sách đơn đặt hàng và lịch sử đặt hàng của người dùng.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nguyễn Tấn Nguyên</td>
        <td><img title="KonstanNguyen-avatar" style="width:30pt; height: auto; align:center; border:solid" src="https://avatars.githubusercontent.com/u/106095525?v=4"/></td>
        <td><a href="https://github.com/KonstanNguyen">KonstanNguyen</a></td>
        <td>
            <ul>
                <li>Tạo cấu trúc chung cho toàn bộ project.</li>
                <li>Thiết kế CSDL.</li>
                <li>Cắt giao diện trang home.</li>
                <li>Cắt giao diện trang tất cả sản phẩm.</li>
                <li>Validation.</li>
                <li>Kiểm lỗi cho team.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Nguyễn Duy Tân</td>
        <td><img title="atlattt-avatar" style="width:30pt; height: auto; align:center; border:solid" src="https://avatars.githubusercontent.com/u/136944347?v=4"/></td>
        <td><a href="https://github.com/atlattt">atlattt</a></td>
        <td>
            <ul>
                <li>Tạo trang giỏ hàng.</li>
                <li>Tạo trang hồ sơ người dùng.</li>
                <li>Tạo trang chi tiết sản phẩm.</li>
                <li>Tạo trang thay đổi mật khẩu.</li>
            </ul>
        </td>
    </tr>
</table>