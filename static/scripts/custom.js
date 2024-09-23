// $(document).on('click', '.add-to-selection', function() {
//     const roomId = $(this).data('index');
//     const roomNumber = $('.room_number_' + roomId).val();
//     const hostelName = $('#hostel_name').val();
//     const roomName = $('#room_name').val();
//     const roomPrice = $('#room_price').val();
//     const roomType = $('#room_type').val();
    
//     // Get checkin and checkout values from the respective form fields
//     const checkinDate = $('#check-in-date').val();  // Ensure correct ID
//     const checkoutDate = $('#check-out-date').val();  // Ensure correct ID

//     console.log(roomId, roomNumber, hostelName, roomName, roomPrice, roomType, checkinDate, checkoutDate);

//     // Validate if checkin and checkout are defined
//     if (!checkinDate || !checkoutDate) {
//         console.error("Checkin and Checkout dates are required!");
//         return;
//     }

//     $.get('/booking/add_to_selection/', {
//         id: roomId,
//         room_id: roomId,
//         room_number: roomNumber,
//         hostel_name: hostelName,
//         room_name: roomName,
//         room_price: roomPrice,
//         room_type: roomType,
//         checkin: checkinDate,
//         checkout: checkoutDate
//     }, function(response) {
//         console.log("Response from server:", response);
//     }).fail(function() {
//         console.error("Error occurred while adding room to selection");
//     });
// });

/////////////////////////////////////////////////////////////////////////////
// $(document).ready(function() {
//     $("#check-in-date").val($("#checkin").val());
//     $("#check-out-date").val($("#checkout").val());
// });


$(document).ready(function(){
    $('.add-to-selection').on("click", function() {
        let button = $(this);
        let id = button.attr("data-index");
        

        let hostel_id = $("#id").val();
        let room_id = $(`.room_id_${id}`).val();
        let room_number = $(`.room_number_${id}`).val();
        let hostel_name = $("#hostel_name").val();
        let room_name = $(`.room_name_${id}`).val(); // Now using the correct selector
        let room_price = $(`.room_price_${id}`).val()
        // let room_name = $("#room_name").val();
        // let room_price = $("#room_price").val();
        let room_type = $("#room_type").val();
        let checkin = $("#checkin").val();
        let checkout = $("#checkout").val();

        console.log(hostel_id);
        console.log(room_id);
        console.log(room_number);
        console.log(hostel_name);
        console.log(room_name);
        console.log(room_price);
        console.log(room_type);
        console.log(checkin);
        console.log(checkout);

        $.ajax({
            
            url:'/booking/add_to_selection/',
            data:{
                'id':id,
                'hostel_id':hostel_id,
                'room_id': room_id,
                'room_number':room_number,
                'hostel_name':hostel_name,
                'room_name':room_name,
                'room_price':room_price,
                'room_type':room_type,
                'checkin':checkin,
                'checkout':checkout,
            },
            dataType:"json",
            beforeSend:function() {
                console.log("sending data to server...")
                button.html("<i class='fas fa-spinner fa-spin'></i> Processing")
            },
            success: function(response){
                $(".room-count".text(response.total_selected_items));
                button.html("<i class='fas fa-check'></i> Added to selection") 
            }
            
        })

    })

});

$(document).on("click",".delete-item", function(){
    let id = $(this).attr("data-item")
    let button = $(this)


    $.ajax({
        url:"/booking/delete_selection/",
        data:{
            "id":id
        },
        dataType:"json",
        beforeSend:function(){
            button.html("<i class='fas fa-spinner fa-spin'></i>")
        },
        success: function(res){
            $(".selection-list").html(res.data)
        }
    })
})


///////////////////////////////////////////////////////////




// $(document).ready(function() {
//     $("#check-in-date").val($("#checkin").val());
//     $("#check-out-date").val($("#checkout").val());
// });

// $(document).ready(function() {
//     $('.add-to-selection').on("click", function() {
//         let button = $(this);
//         let id = button.attr("data-index");
        
//         let hostel_id = $("#id").val();
//         let room_id = $(`.room_id_${id}`).val();
//         let room_number = $(`.room_number_${id}`).val();
//         let hostel_name = $("#hostel_name").val();
//         let room_name = $("#room_name").val();
//         let room_price = $("#room_price").val();
//         let room_type = $("#room_type").val();
//         let checkin = $("#checkin").val();
//         let checkout = $("#checkout").val();

//         console.log(hostel_id);
//         console.log(room_id);
//         console.log(room_number);
//         console.log(hostel_name);
//         console.log(room_name);
//         console.log(room_price);
//         console.log(room_type);
//         console.log(checkin);
//         console.log(checkout);

//         $.ajax({
//             url: '/booking/add_to_selection/',
//             data: {
//                 'id': id,
//                 'hostel_id': hostel_id,
//                 'room_id': room_id,
//                 'room_number': room_number,
//                 'hostel_name': hostel_name,
//                 'room_name': room_name,
//                 'room_price': room_price,
//                 'room_type': room_type,
//                 'checkin': checkin,
//                 'checkout': checkout,
//             },
//             dataType: "json",
//             beforeSend: function() {
//                 console.log("sending data to server...");
//             },
//             success: function(response) {
//                 // Fixed this line
//                 $(".selection-list").html(response.data);
//             },
//             error: function(xhr, status, error) {
//                 console.error("AJAX Error:", status, error);
//             }
//         });
//     });
// });

// $(document).on("click", ".delete-item", function() {
//     let id = $(this).attr("data-item");
//     let button = $(this);

//     $.ajax({
//         url: "/booking/delete_selection/",
//         data: {
//             "id": id
//         },
//         dataType: "json",
//         beforeSend: function() {
//             button.html("<i class='fas fa-spinner fa-spin'></i>");
//         },
//         success: function(res) {
//             $(".selection-list").html(res.data);
//         }
//     });
// });
