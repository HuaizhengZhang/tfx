       ЃK"	  РџзAbrain.Event:2ЫZж!     зъ	Р ѕџзA"

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 

global_step
VariableV2*
shared_name *
_class
loc:@global_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
В
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 

)read_batch_features/file_name_queue/inputConst"/device:CPU:0*
dtype0*
_output_shapes
:*В
valueЈBЅB/usr/local/google/home/jyzhao/airflow/data/tfx/pipelines/chicago_taxi_oneshot/Transform/transformed_examples/5/eval/transformed_examples-00000-of-00001.gz
y
(read_batch_features/file_name_queue/SizeConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
~
-read_batch_features/file_name_queue/Greater/yConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
П
+read_batch_features/file_name_queue/GreaterGreater(read_batch_features/file_name_queue/Size-read_batch_features/file_name_queue/Greater/y"/device:CPU:0*
T0*
_output_shapes
: 
Ж
0read_batch_features/file_name_queue/Assert/ConstConst"/device:CPU:0*G
value>B< B6string_input_producer requires a non-null input tensor*
dtype0*
_output_shapes
: 
О
8read_batch_features/file_name_queue/Assert/Assert/data_0Const"/device:CPU:0*
dtype0*
_output_shapes
: *G
value>B< B6string_input_producer requires a non-null input tensor
Ю
1read_batch_features/file_name_queue/Assert/AssertAssert+read_batch_features/file_name_queue/Greater8read_batch_features/file_name_queue/Assert/Assert/data_0"/device:CPU:0*

T
2*
	summarize
Ы
,read_batch_features/file_name_queue/IdentityIdentity)read_batch_features/file_name_queue/input2^read_batch_features/file_name_queue/Assert/Assert"/device:CPU:0*
T0*
_output_shapes
:
Н
1read_batch_features/file_name_queue/RandomShuffleRandomShuffle,read_batch_features/file_name_queue/Identity"/device:CPU:0*
T0*
_output_shapes
:*
seed2 *

seed 
З
#read_batch_features/file_name_queueFIFOQueueV2"/device:CPU:0*
_output_shapes
: *
component_types
2*
shapes
: *
shared_name *
capacity *
	container 
э
?read_batch_features/file_name_queue/file_name_queue_EnqueueManyQueueEnqueueManyV2#read_batch_features/file_name_queue1read_batch_features/file_name_queue/RandomShuffle"/device:CPU:0*
Tcomponents
2*

timeout_msџџџџџџџџџ

9read_batch_features/file_name_queue/file_name_queue_CloseQueueCloseV2#read_batch_features/file_name_queue"/device:CPU:0*
cancel_pending_enqueues( 

;read_batch_features/file_name_queue/file_name_queue_Close_1QueueCloseV2#read_batch_features/file_name_queue"/device:CPU:0*
cancel_pending_enqueues(

8read_batch_features/file_name_queue/file_name_queue_SizeQueueSizeV2#read_batch_features/file_name_queue"/device:CPU:0*
_output_shapes
: 
М
+read_batch_features/file_name_queue/ToFloatCast8read_batch_features/file_name_queue/file_name_queue_Size"/device:CPU:0*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
}
)read_batch_features/file_name_queue/mul/yConst"/device:CPU:0*
valueB
 *   =*
dtype0*
_output_shapes
: 
Ж
'read_batch_features/file_name_queue/mulMul+read_batch_features/file_name_queue/ToFloat)read_batch_features/file_name_queue/mul/y"/device:CPU:0*
_output_shapes
: *
T0
У
<read_batch_features/file_name_queue/fraction_of_32_full/tagsConst"/device:CPU:0*H
value?B= B7read_batch_features/file_name_queue/fraction_of_32_full*
dtype0*
_output_shapes
: 
п
7read_batch_features/file_name_queue/fraction_of_32_fullScalarSummary<read_batch_features/file_name_queue/fraction_of_32_full/tags'read_batch_features/file_name_queue/mul"/device:CPU:0*
T0*
_output_shapes
: 
Є
)read_batch_features/read/TFRecordReaderV2TFRecordReaderV2"/device:CPU:0*
_output_shapes
: *
	container *
shared_name *
compression_typeGZIP

5read_batch_features/read/ReaderReadUpToV2/num_recordsConst"/device:CPU:0*
value	B	 R(*
dtype0	*
_output_shapes
: 

)read_batch_features/read/ReaderReadUpToV2ReaderReadUpToV2)read_batch_features/read/TFRecordReaderV2#read_batch_features/file_name_queue5read_batch_features/read/ReaderReadUpToV2/num_records"/device:CPU:0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
j
read_batch_features/ConstConst"/device:CPU:0*
dtype0
*
_output_shapes
: *
value	B
 Z
ќ
(read_batch_features/random_shuffle_queueRandomShuffleQueueV2"/device:CPU:0*
_output_shapes
: *
component_types
2*
shapes
: : *

seed *
shared_name *
capacityN*
min_after_dequeueM*
seed2 *
	container 

4read_batch_features/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2(read_batch_features/random_shuffle_queue)read_batch_features/read/ReaderReadUpToV2+read_batch_features/read/ReaderReadUpToV2:1"/device:CPU:0*
Tcomponents
2*

timeout_msџџџџџџџџџ

.read_batch_features/random_shuffle_queue_CloseQueueCloseV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
cancel_pending_enqueues( 

0read_batch_features/random_shuffle_queue_Close_1QueueCloseV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
cancel_pending_enqueues(

-read_batch_features/random_shuffle_queue_SizeQueueSizeV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
_output_shapes
: 
k
read_batch_features/sub/yConst"/device:CPU:0*
value
B :M*
dtype0*
_output_shapes
: 

read_batch_features/subSub-read_batch_features/random_shuffle_queue_Sizeread_batch_features/sub/y"/device:CPU:0*
T0*
_output_shapes
: 
n
read_batch_features/Maximum/xConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

read_batch_features/MaximumMaximumread_batch_features/Maximum/xread_batch_features/sub"/device:CPU:0*
T0*
_output_shapes
: 

read_batch_features/ToFloatCastread_batch_features/Maximum"/device:CPU:0*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
m
read_batch_features/mul/yConst"/device:CPU:0*
valueB
 *<*
dtype0*
_output_shapes
: 

read_batch_features/mulMulread_batch_features/ToFloatread_batch_features/mul/y"/device:CPU:0*
_output_shapes
: *
T0
Й
7read_batch_features/fraction_over_9880_of_120_full/tagsConst"/device:CPU:0*
dtype0*
_output_shapes
: *C
value:B8 B2read_batch_features/fraction_over_9880_of_120_full
Х
2read_batch_features/fraction_over_9880_of_120_fullScalarSummary7read_batch_features/fraction_over_9880_of_120_full/tagsread_batch_features/mul"/device:CPU:0*
T0*
_output_shapes
: 
f
read_batch_features/nConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B :(
б
read_batch_featuresQueueDequeueManyV2(read_batch_features/random_shuffle_queueread_batch_features/n"/device:CPU:0*

timeout_msџџџџџџџџџ* 
_output_shapes
:(:(*
component_types
2
x
&read_batch_features/ParseExample/ConstConst"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_1Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_2Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_3Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
z
(read_batch_features/ParseExample/Const_4Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
z
(read_batch_features/ParseExample/Const_5Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_6Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_7Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_8Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_9Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_10Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
{
)read_batch_features/ParseExample/Const_11Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
{
)read_batch_features/ParseExample/Const_12Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_13Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_14Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_15Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_16Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 

3read_batch_features/ParseExample/ParseExample/namesConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB 

:read_batch_features/ParseExample/ParseExample/dense_keys_0Const"/device:CPU:0*
valueB B
company_xf*
dtype0*
_output_shapes
: 
Ё
:read_batch_features/ParseExample/ParseExample/dense_keys_1Const"/device:CPU:0*
dtype0*
_output_shapes
: *(
valueB Bdropoff_census_tract_xf
Ѓ
:read_batch_features/ParseExample/ParseExample/dense_keys_2Const"/device:CPU:0**
value!B Bdropoff_community_area_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_3Const"/device:CPU:0*
dtype0*
_output_shapes
: *$
valueB Bdropoff_latitude_xf

:read_batch_features/ParseExample/ParseExample/dense_keys_4Const"/device:CPU:0*%
valueB Bdropoff_longitude_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_5Const"/device:CPU:0*
valueB Bfare_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_6Const"/device:CPU:0*
dtype0*
_output_shapes
: * 
valueB Bpayment_type_xf
 
:read_batch_features/ParseExample/ParseExample/dense_keys_7Const"/device:CPU:0*'
valueB Bpickup_census_tract_xf*
dtype0*
_output_shapes
: 
Ђ
:read_batch_features/ParseExample/ParseExample/dense_keys_8Const"/device:CPU:0*)
value B Bpickup_community_area_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_9Const"/device:CPU:0*#
valueB Bpickup_latitude_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_10Const"/device:CPU:0*
dtype0*
_output_shapes
: *$
valueB Bpickup_longitude_xf

;read_batch_features/ParseExample/ParseExample/dense_keys_11Const"/device:CPU:0*
valueB Btips_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_12Const"/device:CPU:0*
valueB Btrip_miles_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_13Const"/device:CPU:0* 
valueB Btrip_seconds_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_14Const"/device:CPU:0*"
valueB Btrip_start_day_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_15Const"/device:CPU:0*#
valueB Btrip_start_hour_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_16Const"/device:CPU:0*$
valueB Btrip_start_month_xf*
dtype0*
_output_shapes
: 
ю
-read_batch_features/ParseExample/ParseExampleParseExampleread_batch_features:13read_batch_features/ParseExample/ParseExample/names:read_batch_features/ParseExample/ParseExample/dense_keys_0:read_batch_features/ParseExample/ParseExample/dense_keys_1:read_batch_features/ParseExample/ParseExample/dense_keys_2:read_batch_features/ParseExample/ParseExample/dense_keys_3:read_batch_features/ParseExample/ParseExample/dense_keys_4:read_batch_features/ParseExample/ParseExample/dense_keys_5:read_batch_features/ParseExample/ParseExample/dense_keys_6:read_batch_features/ParseExample/ParseExample/dense_keys_7:read_batch_features/ParseExample/ParseExample/dense_keys_8:read_batch_features/ParseExample/ParseExample/dense_keys_9;read_batch_features/ParseExample/ParseExample/dense_keys_10;read_batch_features/ParseExample/ParseExample/dense_keys_11;read_batch_features/ParseExample/ParseExample/dense_keys_12;read_batch_features/ParseExample/ParseExample/dense_keys_13;read_batch_features/ParseExample/ParseExample/dense_keys_14;read_batch_features/ParseExample/ParseExample/dense_keys_15;read_batch_features/ParseExample/ParseExample/dense_keys_16&read_batch_features/ParseExample/Const(read_batch_features/ParseExample/Const_1(read_batch_features/ParseExample/Const_2(read_batch_features/ParseExample/Const_3(read_batch_features/ParseExample/Const_4(read_batch_features/ParseExample/Const_5(read_batch_features/ParseExample/Const_6(read_batch_features/ParseExample/Const_7(read_batch_features/ParseExample/Const_8(read_batch_features/ParseExample/Const_9)read_batch_features/ParseExample/Const_10)read_batch_features/ParseExample/Const_11)read_batch_features/ParseExample/Const_12)read_batch_features/ParseExample/Const_13)read_batch_features/ParseExample/Const_14)read_batch_features/ParseExample/Const_15)read_batch_features/ParseExample/Const_16"/device:CPU:0*
Tdense
2											*
Ndense*z
_output_shapesh
f:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(*
Nsparse *4
dense_shapes$
": : : : : : : : : : : : : : : : : *
sparse_types
 
С
read_batch_features/fifo_queueFIFOQueueV2"/device:CPU:0*
_output_shapes
: *)
component_types
2											*
shapes
 *
shared_name *
capacityd*
	container 
y
#read_batch_features/fifo_queue_SizeQueueSizeV2read_batch_features/fifo_queue"/device:CPU:0*
_output_shapes
: 

read_batch_features/CastCast#read_batch_features/fifo_queue_Size"/device:CPU:0*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
o
read_batch_features/mul_1/yConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB
 *
з#<

read_batch_features/mul_1Mulread_batch_features/Castread_batch_features/mul_1/y"/device:CPU:0*
T0*
_output_shapes
: 

bread_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full/tagsConst"/device:CPU:0*n
valueeBc B]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full*
dtype0*
_output_shapes
: 

]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_fullScalarSummarybread_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full/tagsread_batch_features/mul_1"/device:CPU:0*
_output_shapes
: *
T0

&read_batch_features/fifo_queue_enqueueQueueEnqueueV2read_batch_features/fifo_queue-read_batch_features/ParseExample/ParseExample/read_batch_features/ParseExample/ParseExample:1/read_batch_features/ParseExample/ParseExample:2/read_batch_features/ParseExample/ParseExample:3/read_batch_features/ParseExample/ParseExample:4/read_batch_features/ParseExample/ParseExample:5/read_batch_features/ParseExample/ParseExample:6/read_batch_features/ParseExample/ParseExample:7/read_batch_features/ParseExample/ParseExample:8/read_batch_features/ParseExample/ParseExample:90read_batch_features/ParseExample/ParseExample:100read_batch_features/ParseExample/ParseExample:110read_batch_features/ParseExample/ParseExample:120read_batch_features/ParseExample/ParseExample:130read_batch_features/ParseExample/ParseExample:140read_batch_features/ParseExample/ParseExample:150read_batch_features/ParseExample/ParseExample:16read_batch_features"/device:CPU:0*%
Tcomponents
2											*

timeout_msџџџџџџџџџ

(read_batch_features/fifo_queue_enqueue_1QueueEnqueueV2read_batch_features/fifo_queue-read_batch_features/ParseExample/ParseExample/read_batch_features/ParseExample/ParseExample:1/read_batch_features/ParseExample/ParseExample:2/read_batch_features/ParseExample/ParseExample:3/read_batch_features/ParseExample/ParseExample:4/read_batch_features/ParseExample/ParseExample:5/read_batch_features/ParseExample/ParseExample:6/read_batch_features/ParseExample/ParseExample:7/read_batch_features/ParseExample/ParseExample:8/read_batch_features/ParseExample/ParseExample:90read_batch_features/ParseExample/ParseExample:100read_batch_features/ParseExample/ParseExample:110read_batch_features/ParseExample/ParseExample:120read_batch_features/ParseExample/ParseExample:130read_batch_features/ParseExample/ParseExample:140read_batch_features/ParseExample/ParseExample:150read_batch_features/ParseExample/ParseExample:16read_batch_features"/device:CPU:0*%
Tcomponents
2											*

timeout_msџџџџџџџџџ

$read_batch_features/fifo_queue_CloseQueueCloseV2read_batch_features/fifo_queue"/device:CPU:0*
cancel_pending_enqueues( 

&read_batch_features/fifo_queue_Close_1QueueCloseV2read_batch_features/fifo_queue"/device:CPU:0*
cancel_pending_enqueues(
А
&read_batch_features/fifo_queue_DequeueQueueDequeueV2read_batch_features/fifo_queue"/device:CPU:0*

timeout_msџџџџџџџџџ*
_output_shapesn
l:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(*)
component_types
2											

Adnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
э
=dnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:5Adnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims/dim*

Tdim0*
T0*
_output_shapes

:(

8dnn/input_from_feature_columns/input_layer/fare_xf/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Fdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ј
@dnn/input_from_feature_columns/input_layer/fare_xf/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/fare_xf/ShapeFdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stackHdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Bdnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

@dnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/fare_xf/strided_sliceBdnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
§
:dnn/input_from_feature_columns/input_layer/fare_xf/ReshapeReshape=dnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims@dnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(

Gdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
њ
Cdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:12Gdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0

>dnn/input_from_feature_columns/input_layer/trip_miles_xf/ShapeConst*
dtype0*
_output_shapes
:*
valueB"(      

Ldnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 

Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Fdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/trip_miles_xf/ShapeLdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stackNdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask

Hdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

Fdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_sliceHdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/trip_miles_xf/ReshapeReshapeCdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDimsFdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(

Idnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ў
Ednn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:13Idnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims/dim*

Tdim0*
T0*
_output_shapes

:(

@dnn/input_from_feature_columns/input_layer/trip_seconds_xf/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
 
Hdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/trip_seconds_xf/ShapeNdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stackPdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

Jdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
 
Hdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_sliceJdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 

Bdnn/input_from_feature_columns/input_layer/trip_seconds_xf/ReshapeReshapeEdnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDimsHdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
ѕ
1dnn/input_from_feature_columns/input_layer/concatConcatV2:dnn/input_from_feature_columns/input_layer/fare_xf/Reshape@dnn/input_from_feature_columns/input_layer/trip_miles_xf/ReshapeBdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*

Tidx0*
T0*
N*
_output_shapes

:(
Х
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB"   d   *
dtype0*
_output_shapes
:
З
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *о%wО*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *о%w>*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:d*

seed 

>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

:d

:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

:d*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
п
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*
	container *
shape
:d*
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0

@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0
Ч
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d
Ў
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
valueBd*    *
dtype0*
_output_shapes
:d
е
dnn/hiddenlayer_0/bias/part_0VarHandleOp*
	container *
shape:d*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0

>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d

'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d
v
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes

:d
О
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*
_output_shapes

:(d*
transpose_a( *
transpose_b( 

%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d
n
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
_output_shapes
:d*
T0

dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*
_output_shapes

:(d
b
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:(d
[
dnn/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
y
dnn/zero_fraction/EqualEqualdnn/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:(d

dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
Truncate( *
_output_shapes

:(d*

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
 
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Ћ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
Х
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB"d   F   *
dtype0*
_output_shapes
:
З
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *H`@О*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *H`@>*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:dF*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2 

>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ќ
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes

:dF*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0

:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

:dF*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
п
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
	container *
shape
:dF*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ч
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ў
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:F*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
valueBF*    
е
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container *
shape:F

>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F

'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF
v
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
_output_shapes

:dF*
T0
Ѓ
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Reludnn/hiddenlayer_1/kernel*
T0*
_output_shapes

:(F*
transpose_a( *
transpose_b( 

%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F
n
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
T0*
_output_shapes
:F

dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
data_formatNHWC*
_output_shapes

:(F*
T0
b
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
_output_shapes

:(F*
T0
]
dnn/zero_fraction_1/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
}
dnn/zero_fraction_1/EqualEqualdnn/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
_output_shapes

:(F*
T0

dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*
Truncate( *
_output_shapes

:(F*

DstT0*

SrcT0

j
dnn/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
_output_shapes
: *
T0

$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
Х
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB"F   0   *
dtype0*
_output_shapes
:
З
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *йчfО*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *йчf>

Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:F0*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
seed2 

>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:F0

:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:F0
п
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
	container *
shape
:F0*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
Ч
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
Ў
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
valueB0*    *
dtype0*
_output_shapes
:0
е
dnn/hiddenlayer_2/bias/part_0VarHandleOp*
	container *
shape:0*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0

>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0

'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
v
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
T0*
_output_shapes

:F0
Ѓ
dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Reludnn/hiddenlayer_2/kernel*
T0*
_output_shapes

:(0*
transpose_a( *
transpose_b( 

%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0
n
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
T0*
_output_shapes
:0

dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*
data_formatNHWC*
_output_shapes

:(0
b
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
_output_shapes

:(0*
T0
]
dnn/zero_fraction_2/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
}
dnn/zero_fraction_2/EqualEqualdnn/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:(0

dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
Truncate( *
_output_shapes

:(0*

DstT0
j
dnn/zero_fraction_2/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
 
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
_output_shapes
: *
T0

$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
Х
@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
valueB"0   "   
З
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
valueB
 *О
З
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
valueB
 *>

Hdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:0"*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
seed2 

>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
_output_shapes

:0"

:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
_output_shapes

:0"
п
dnn/hiddenlayer_3/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_3/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
	container *
shape
:0"*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_3/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_3/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/kernel/part_0:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0
Ч
3dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
Ў
/dnn/hiddenlayer_3/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:"*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
valueB"*    
е
dnn/hiddenlayer_3/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_3/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
	container *
shape:"

>dnn/hiddenlayer_3/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_3/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/bias/part_0/dnn/hiddenlayer_3/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0
Н
1dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"

'dnn/hiddenlayer_3/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
v
dnn/hiddenlayer_3/kernelIdentity'dnn/hiddenlayer_3/kernel/ReadVariableOp*
T0*
_output_shapes

:0"
Ѓ
dnn/hiddenlayer_3/MatMulMatMuldnn/hiddenlayer_2/Reludnn/hiddenlayer_3/kernel*
T0*
_output_shapes

:("*
transpose_a( *
transpose_b( 

%dnn/hiddenlayer_3/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"
n
dnn/hiddenlayer_3/biasIdentity%dnn/hiddenlayer_3/bias/ReadVariableOp*
T0*
_output_shapes
:"

dnn/hiddenlayer_3/BiasAddBiasAdddnn/hiddenlayer_3/MatMuldnn/hiddenlayer_3/bias*
data_formatNHWC*
_output_shapes

:("*
T0
b
dnn/hiddenlayer_3/ReluReludnn/hiddenlayer_3/BiasAdd*
T0*
_output_shapes

:("
]
dnn/zero_fraction_3/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
dnn/zero_fraction_3/EqualEqualdnn/hiddenlayer_3/Reludnn/zero_fraction_3/zero*
T0*
_output_shapes

:("

dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
Truncate( *
_output_shapes

:("*

DstT0
j
dnn/zero_fraction_3/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
 
2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_3/fraction_of_zero_values*
dtype0*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_3/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
_output_shapes
: *
T0

$dnn/dnn/hiddenlayer_3/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_3/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_3/activationHistogramSummary$dnn/dnn/hiddenlayer_3/activation/tagdnn/hiddenlayer_3/Relu*
T0*
_output_shapes
: 
З
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB""      *
dtype0*
_output_shapes
:
Љ
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *їќгО*
dtype0*
_output_shapes
: 
Љ
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *їќг>*
dtype0*
_output_shapes
: 

Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:"*

seed *
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
seed2 
ў
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 

7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:"

3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:"
Ъ
dnn/logits/kernel/part_0VarHandleOp*)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
	container *
shape
:"*
dtype0*
_output_shapes
: 

9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
М
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
В
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
 
(dnn/logits/bias/part_0/Initializer/zerosConst*)
_class
loc:@dnn/logits/bias/part_0*
valueB*    *
dtype0*
_output_shapes
:
Р
dnn/logits/bias/part_0VarHandleOp*'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
Ћ
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*
dtype0*)
_class
loc:@dnn/logits/bias/part_0
Ј
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
y
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
h
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
T0*
_output_shapes

:"

dnn/logits/MatMulMatMuldnn/hiddenlayer_3/Reludnn/logits/kernel*
transpose_b( *
T0*
_output_shapes

:(*
transpose_a( 
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
T0*
_output_shapes
:

dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*
data_formatNHWC*
_output_shapes

:(
]
dnn/zero_fraction_4/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
y
dnn/zero_fraction_4/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_4/zero*
T0*
_output_shapes

:(

dnn/zero_fraction_4/CastCastdnn/zero_fraction_4/Equal*
Truncate( *
_output_shapes

:(*

DstT0*

SrcT0

j
dnn/zero_fraction_4/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_4/MeanMeandnn/zero_fraction_4/Castdnn/zero_fraction_4/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 

&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_4/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 

dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: *
T0
т
Olinear/linear_model/company_xf/weights/part_0/Initializer/zeros/shape_as_tensorConst*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
valueB"ђ     *
dtype0*
_output_shapes
:
Ь
Elinear/linear_model/company_xf/weights/part_0/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
valueB
 *    
н
?linear/linear_model/company_xf/weights/part_0/Initializer/zerosFillOlinear/linear_model/company_xf/weights/part_0/Initializer/zeros/shape_as_tensorElinear/linear_model/company_xf/weights/part_0/Initializer/zeros/Const*
T0*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*

index_type0*
_output_shapes
:	ђ

-linear/linear_model/company_xf/weights/part_0VarHandleOp*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
	container *
shape:	ђ*
dtype0*
_output_shapes
: *>
shared_name/-linear/linear_model/company_xf/weights/part_0
Ћ
Nlinear/linear_model/company_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

4linear/linear_model/company_xf/weights/part_0/AssignAssignVariableOp-linear/linear_model/company_xf/weights/part_0?linear/linear_model/company_xf/weights/part_0/Initializer/zeros*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0
ђ
Alinear/linear_model/company_xf/weights/part_0/Read/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

:linear/linear_model/linear_model/company_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
н
6linear/linear_model/linear_model/company_xf/ExpandDims
ExpandDims&read_batch_features/fifo_queue_Dequeue:linear/linear_model/linear_model/company_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Jlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
м
Hlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_valueCastJlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ћ
Dlinear/linear_model/linear_model/company_xf/to_sparse_input/NotEqualNotEqual6linear/linear_model/linear_model/company_xf/ExpandDimsHlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
Ф
Clinear/linear_model/linear_model/company_xf/to_sparse_input/indicesWhereDlinear/linear_model/linear_model/company_xf/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ*
T0


Blinear/linear_model/linear_model/company_xf/to_sparse_input/valuesGatherNd6linear/linear_model/linear_model/company_xf/ExpandDimsClinear/linear_model/linear_model/company_xf/to_sparse_input/indices*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Tindices0	
 
Glinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              
|
9linear/linear_model/linear_model/company_xf/num_buckets/xConst*
dtype0*
_output_shapes
: *
value
B :ђ
К
7linear/linear_model/linear_model/company_xf/num_bucketsCast9linear/linear_model/linear_model/company_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
t
2linear/linear_model/linear_model/company_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ќ
0linear/linear_model/linear_model/company_xf/zeroCast2linear/linear_model/linear_model/company_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
м
0linear/linear_model/linear_model/company_xf/LessLessBlinear/linear_model/linear_model/company_xf/to_sparse_input/values0linear/linear_model/linear_model/company_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ
ѓ
8linear/linear_model/linear_model/company_xf/GreaterEqualGreaterEqualBlinear/linear_model/linear_model/company_xf/to_sparse_input/values7linear/linear_model/linear_model/company_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ж
8linear/linear_model/linear_model/company_xf/out_of_range	LogicalOr0linear/linear_model/linear_model/company_xf/Less8linear/linear_model/linear_model/company_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Г
1linear/linear_model/linear_model/company_xf/ShapeShapeBlinear/linear_model/linear_model/company_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:
w
5linear/linear_model/linear_model/company_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
В
3linear/linear_model/linear_model/company_xf/ToInt64Cast5linear/linear_model/linear_model/company_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ъ
:linear/linear_model/linear_model/company_xf/default_valuesFill1linear/linear_model/linear_model/company_xf/Shape3linear/linear_model/linear_model/company_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Є
2linear/linear_model/linear_model/company_xf/SelectSelect8linear/linear_model/linear_model/company_xf/out_of_range:linear/linear_model/linear_model/company_xf/default_valuesBlinear/linear_model/linear_model/company_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
Э
8linear/linear_model/linear_model/company_xf/Shape_1/CastCastGlinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

?linear/linear_model/linear_model/company_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Alinear/linear_model/linear_model/company_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Alinear/linear_model/linear_model/company_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
м
9linear/linear_model/linear_model/company_xf/strided_sliceStridedSlice8linear/linear_model/linear_model/company_xf/Shape_1/Cast?linear/linear_model/linear_model/company_xf/strided_slice/stackAlinear/linear_model/linear_model/company_xf/strided_slice/stack_1Alinear/linear_model/linear_model/company_xf/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

4linear/linear_model/linear_model/company_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
х
2linear/linear_model/linear_model/company_xf/Cast/xPack9linear/linear_model/linear_model/company_xf/strided_slice4linear/linear_model/linear_model/company_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
А
0linear/linear_model/linear_model/company_xf/CastCast2linear/linear_model/linear_model/company_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
Й
9linear/linear_model/linear_model/company_xf/SparseReshapeSparseReshapeClinear/linear_model/linear_model/company_xf/to_sparse_input/indicesGlinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shape0linear/linear_model/linear_model/company_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
А
Blinear/linear_model/linear_model/company_xf/SparseReshape/IdentityIdentity2linear/linear_model/linear_model/company_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
Љ
:linear/linear_model/linear_model/company_xf/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

Dlinear/linear_model/linear_model/company_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Clinear/linear_model/linear_model/company_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
С
>linear/linear_model/linear_model/company_xf/weighted_sum/SliceSlice;linear/linear_model/linear_model/company_xf/SparseReshape:1Dlinear/linear_model/linear_model/company_xf/weighted_sum/Slice/beginClinear/linear_model/linear_model/company_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

>linear/linear_model/linear_model/company_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

=linear/linear_model/linear_model/company_xf/weighted_sum/ProdProd>linear/linear_model/linear_model/company_xf/weighted_sum/Slice>linear/linear_model/linear_model/company_xf/weighted_sum/Const*
	keep_dims( *

Tidx0*
T0	*
_output_shapes
: 

Ilinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Flinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
с
Alinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2GatherV2;linear/linear_model/linear_model/company_xf/SparseReshape:1Ilinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/indicesFlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

?linear/linear_model/linear_model/company_xf/weighted_sum/Cast/xPack=linear/linear_model/linear_model/company_xf/weighted_sum/ProdAlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
П
Flinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshapeSparseReshape9linear/linear_model/linear_model/company_xf/SparseReshape;linear/linear_model/linear_model/company_xf/SparseReshape:1?linear/linear_model/linear_model/company_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Э
Olinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/IdentityIdentityBlinear/linear_model/linear_model/company_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 

Elinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqualGreaterEqualOlinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/IdentityGlinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
Р
>linear/linear_model/linear_model/company_xf/weighted_sum/WhereWhereElinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Flinear/linear_model/linear_model/company_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeReshape>linear/linear_model/linear_model/company_xf/weighted_sum/WhereFlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ј
Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1GatherV2Flinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeHlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0

Hlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
§
Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2GatherV2Olinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/Identity@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeHlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
М
Alinear/linear_model/linear_model/company_xf/weighted_sum/IdentityIdentityHlinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

Rlinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
ї
`linear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsClinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2Alinear/linear_model/linear_model/company_xf/weighted_sum/IdentityRlinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/Const*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ*
T0	
Е
dlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
З
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
З
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Ѕ
^linear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlice`linear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsdlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackflinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	

Ulinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/CastCast^linear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0*

SrcT0	

Wlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueblinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ї
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*M
_classC
A?loc:@linear/linear_model/linear_model/company_xf/ReadVariableOp*
value	B : *
dtype0*
_output_shapes
: 

alinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2:linear/linear_model/linear_model/company_xf/ReadVariableOpWlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Uniqueflinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0*M
_classC
A?loc:@linear/linear_model/linear_model/company_xf/ReadVariableOp

jlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityalinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
Р
Plinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumjlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityYlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Unique:1Ulinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0

Hlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
Л
Blinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1Reshapeblinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Hlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
Ю
>linear/linear_model/linear_model/company_xf/weighted_sum/ShapeShapePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Llinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/company_xf/weighted_sum/strided_sliceStridedSlice>linear/linear_model/linear_model/company_xf/weighted_sum/ShapeLlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stackNlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_1Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask

@linear/linear_model/linear_model/company_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 

>linear/linear_model/linear_model/company_xf/weighted_sum/stackPack@linear/linear_model/linear_model/company_xf/weighted_sum/stack/0Flinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:

=linear/linear_model/linear_model/company_xf/weighted_sum/TileTileBlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1>linear/linear_model/linear_model/company_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
д
Clinear/linear_model/linear_model/company_xf/weighted_sum/zeros_like	ZerosLikePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
Ъ
8linear/linear_model/linear_model/company_xf/weighted_sumSelect=linear/linear_model/linear_model/company_xf/weighted_sum/TileClinear/linear_model/linear_model/company_xf/weighted_sum/zeros_likePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
Ш
?linear/linear_model/linear_model/company_xf/weighted_sum/Cast_1Cast;linear/linear_model/linear_model/company_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Ы
@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_1Slice?linear/linear_model/linear_model/company_xf/weighted_sum/Cast_1Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/beginElinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/size*
_output_shapes
:*
Index0*
T0
И
@linear/linear_model/linear_model/company_xf/weighted_sum/Shape_1Shape8linear/linear_model/linear_model/company_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ь
@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_2Slice@linear/linear_model/linear_model/company_xf/weighted_sum/Shape_1Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/beginElinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Dlinear/linear_model/linear_model/company_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Я
?linear/linear_model/linear_model/company_xf/weighted_sum/concatConcatV2@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_1@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_2Dlinear/linear_model/linear_model/company_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Blinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_2Reshape8linear/linear_model/linear_model/company_xf/weighted_sum?linear/linear_model/linear_model/company_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zerosConst*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0*
valueB
*    *
dtype0*
_output_shapes

:

Є
6linear/linear_model/dropoff_latitude_xf/weights/part_0VarHandleOp*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0*
	container *
shape
:
*
dtype0*
_output_shapes
: *G
shared_name86linear/linear_model/dropoff_latitude_xf/weights/part_0
Н
Wlinear/linear_model/dropoff_latitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/dropoff_latitude_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0Hlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zeros*
dtype0*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0

Jlinear/linear_model/dropoff_latitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:
*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0

Clinear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ё
?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:3Clinear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	

Slinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
Qlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Mlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDimsQlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
ж
Llinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDimsLlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Љ
Plinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

Blinear/linear_model/linear_model/dropoff_latitude_xf/num_buckets/xConst*
dtype0*
_output_shapes
: *
value	B :

Ь
@linear/linear_model/linear_model/dropoff_latitude_xf/num_bucketsCastBlinear/linear_model/linear_model/dropoff_latitude_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
}
;linear/linear_model/linear_model/dropoff_latitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/dropoff_latitude_xf/zeroCast;linear/linear_model/linear_model/dropoff_latitude_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ї
9linear/linear_model/linear_model/dropoff_latitude_xf/LessLessKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values9linear/linear_model/linear_model/dropoff_latitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Alinear/linear_model/linear_model/dropoff_latitude_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values@linear/linear_model/linear_model/dropoff_latitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/dropoff_latitude_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/dropoff_latitude_xf/LessAlinear/linear_model/linear_model/dropoff_latitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/dropoff_latitude_xf/ShapeShapeKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

>linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ф
<linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64Cast>linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Clinear/linear_model/linear_model/dropoff_latitude_xf/default_valuesFill:linear/linear_model/linear_model/dropoff_latitude_xf/Shape<linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ш
;linear/linear_model/linear_model/dropoff_latitude_xf/SelectSelectAlinear/linear_model/linear_model/dropoff_latitude_xf/out_of_rangeClinear/linear_model/linear_model/dropoff_latitude_xf/default_valuesKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
п
Alinear/linear_model/linear_model/dropoff_latitude_xf/Shape_1/CastCastPlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Hlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/dropoff_latitude_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/dropoff_latitude_xf/Shape_1/CastHlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stackJlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

=linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 

;linear/linear_model/linear_model/dropoff_latitude_xf/Cast/xPackBlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice=linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Т
9linear/linear_model/linear_model/dropoff_latitude_xf/CastCast;linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
н
Blinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/dropoff_latitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/dropoff_latitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
К
Clinear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
х
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SliceGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0	

Rlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Rlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0

Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ProdJlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
у
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshapeDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape/Identity*#
_output_shapes
:џџџџџџџџџ*
T0	

Plinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
И
Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual/y*#
_output_shapes
:џџџџџџџџџ*
T0	
в
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ђ
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Њ
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/WhereOlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0

Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ю
Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

[linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Є
ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Identity[linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/Const*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ*
T0	
О
mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0

^linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ѓ
`linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *V
_classL
JHloc:@linear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp*
value	B : 
Л
jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp`linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0

slinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
ф
Ylinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ђ
Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
ж
Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
р
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Ulinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
У
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 

Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
Ѕ
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Б
Flinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ц
Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ю
Alinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sumSelectFlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/TileLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
к
Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
я
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
№
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ѓ
Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
Ѓ
Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sumHlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ъ
Ilinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:
*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
valueB
*    
Ї
7linear/linear_model/dropoff_longitude_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *H
shared_name97linear/linear_model/dropoff_longitude_xf/weights/part_0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
	container *
shape
:

П
Xlinear/linear_model/dropoff_longitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 
Џ
>linear/linear_model/dropoff_longitude_xf/weights/part_0/AssignAssignVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0Ilinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zeros*
dtype0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0

Klinear/linear_model/dropoff_longitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Dlinear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ѓ
@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:4Dlinear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	

Tlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
№
Rlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_valueCastTlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Nlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/NotEqualNotEqual@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDimsRlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
и
Mlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indicesWhereNlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
­
Llinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/valuesGatherNd@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDimsMlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Њ
Qlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Clinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ю
Alinear/linear_model/linear_model/dropoff_longitude_xf/num_bucketsCastClinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
~
<linear/linear_model/linear_model/dropoff_longitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
Р
:linear/linear_model/linear_model/dropoff_longitude_xf/zeroCast<linear/linear_model/linear_model/dropoff_longitude_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
њ
:linear/linear_model/linear_model/dropoff_longitude_xf/LessLessLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values:linear/linear_model/linear_model/dropoff_longitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Blinear/linear_model/linear_model/dropoff_longitude_xf/GreaterEqualGreaterEqualLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/valuesAlinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
є
Blinear/linear_model/linear_model/dropoff_longitude_xf/out_of_range	LogicalOr:linear/linear_model/linear_model/dropoff_longitude_xf/LessBlinear/linear_model/linear_model/dropoff_longitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Ч
;linear/linear_model/linear_model/dropoff_longitude_xf/ShapeShapeLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

?linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ц
=linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64Cast?linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Dlinear/linear_model/linear_model/dropoff_longitude_xf/default_valuesFill;linear/linear_model/linear_model/dropoff_longitude_xf/Shape=linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64*#
_output_shapes
:џџџџџџџџџ*
T0	*

index_type0
Ь
<linear/linear_model/linear_model/dropoff_longitude_xf/SelectSelectBlinear/linear_model/linear_model/dropoff_longitude_xf/out_of_rangeDlinear/linear_model/linear_model/dropoff_longitude_xf/default_valuesLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
с
Blinear/linear_model/linear_model/dropoff_longitude_xf/Shape_1/CastCastQlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Ilinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Clinear/linear_model/linear_model/dropoff_longitude_xf/strided_sliceStridedSliceBlinear/linear_model/linear_model/dropoff_longitude_xf/Shape_1/CastIlinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stackKlinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_1Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

>linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ

<linear/linear_model/linear_model/dropoff_longitude_xf/Cast/xPackClinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice>linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Ф
:linear/linear_model/linear_model/dropoff_longitude_xf/CastCast<linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
с
Clinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshapeSparseReshapeMlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indicesQlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shape:linear/linear_model/linear_model/dropoff_longitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Ф
Llinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape/IdentityIdentity<linear/linear_model/linear_model/dropoff_longitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
М
Dlinear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
щ
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SliceSliceElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/beginMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ё
Glinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ProdProdHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SliceHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0

Slinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2GatherV2Elinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Slinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/indicesPlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0
Ё
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast/xPackGlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ProdKlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
ч
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshapeSparseReshapeClinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshapeElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
с
Ylinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityIdentityLlinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Л
Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqualGreaterEqualYlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityQlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
д
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/WhereWhereOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ѓ
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
­
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeReshapeHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/WherePlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
 
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1GatherV2Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshapeJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
Ѕ
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2GatherV2Ylinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
а
Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/IdentityIdentityRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

\linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Љ
jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Identity\linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
П
nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
С
plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
С
plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
з
hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicejlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsnlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackplinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ

_linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/CastCasthlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ѕ
alinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquellinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*W
_classM
KIloc:@linear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOp*
value	B : *
dtype0*
_output_shapes
: 
Р
klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Dlinear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOpalinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueplinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*W
_classM
KIloc:@linear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

tlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityklinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
ш
Zlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumtlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityclinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1_linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0
Ѓ
Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
й
Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1Reshapellinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
т
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ShapeShapeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0
 
Vlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ђ
Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
Ђ
Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Ш
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_sliceStridedSliceHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ShapeVlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stackXlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_1Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ј
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stackPackJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack/0Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Д
Glinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/TileTileLlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ш
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/zeros_like	ZerosLikeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ђ
Blinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sumSelectGlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/TileMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/zeros_likeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
м
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast_1CastElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
ѓ
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1SliceIlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast_1Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/beginOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/size*
_output_shapes
:*
Index0*
T0
Ь
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Shape_1ShapeBlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum*
_output_shapes
:*
T0*
out_type0

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Ђ
Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
є
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2SliceJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Shape_1Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/beginOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ї
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concatConcatV2Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
І
Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_2ReshapeBlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sumIlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ь
Tlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/shape_as_tensorConst*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
valueB"ђ     *
dtype0*
_output_shapes
:
ж
Jlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/ConstConst*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
valueB
 *    *
dtype0*
_output_shapes
: 
ё
Dlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zerosFillTlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/shape_as_tensorJlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/Const*
T0*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*

index_type0*
_output_shapes
:	ђ

2linear/linear_model/payment_type_xf/weights/part_0VarHandleOp*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
	container *
shape:	ђ*
dtype0*
_output_shapes
: *C
shared_name42linear/linear_model/payment_type_xf/weights/part_0
Е
Slinear/linear_model/payment_type_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

9linear/linear_model/payment_type_xf/weights/part_0/AssignAssignVariableOp2linear/linear_model/payment_type_xf/weights/part_0Dlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
dtype0

Flinear/linear_model/payment_type_xf/weights/part_0/Read/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0

?linear/linear_model/linear_model/payment_type_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
щ
;linear/linear_model/linear_model/payment_type_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:6?linear/linear_model/linear_model/payment_type_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Olinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ц
Mlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_valueCastOlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0

Ilinear/linear_model/linear_model/payment_type_xf/to_sparse_input/NotEqualNotEqual;linear/linear_model/linear_model/payment_type_xf/ExpandDimsMlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
Ю
Hlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indicesWhereIlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/linear_model/payment_type_xf/to_sparse_input/valuesGatherNd;linear/linear_model/linear_model/payment_type_xf/ExpandDimsHlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Ѕ
Llinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

>linear/linear_model/linear_model/payment_type_xf/num_buckets/xConst*
value
B :ђ*
dtype0*
_output_shapes
: 
Ф
<linear/linear_model/linear_model/payment_type_xf/num_bucketsCast>linear/linear_model/linear_model/payment_type_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
y
7linear/linear_model/linear_model/payment_type_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ж
5linear/linear_model/linear_model/payment_type_xf/zeroCast7linear/linear_model/linear_model/payment_type_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ы
5linear/linear_model/linear_model/payment_type_xf/LessLessGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values5linear/linear_model/linear_model/payment_type_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

=linear/linear_model/linear_model/payment_type_xf/GreaterEqualGreaterEqualGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values<linear/linear_model/linear_model/payment_type_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
х
=linear/linear_model/linear_model/payment_type_xf/out_of_range	LogicalOr5linear/linear_model/linear_model/payment_type_xf/Less=linear/linear_model/linear_model/payment_type_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Н
6linear/linear_model/linear_model/payment_type_xf/ShapeShapeGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values*
_output_shapes
:*
T0	*
out_type0
|
:linear/linear_model/linear_model/payment_type_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
М
8linear/linear_model/linear_model/payment_type_xf/ToInt64Cast:linear/linear_model/linear_model/payment_type_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
љ
?linear/linear_model/linear_model/payment_type_xf/default_valuesFill6linear/linear_model/linear_model/payment_type_xf/Shape8linear/linear_model/linear_model/payment_type_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
И
7linear/linear_model/linear_model/payment_type_xf/SelectSelect=linear/linear_model/linear_model/payment_type_xf/out_of_range?linear/linear_model/linear_model/payment_type_xf/default_valuesGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values*#
_output_shapes
:џџџџџџџџџ*
T0	
з
=linear/linear_model/linear_model/payment_type_xf/Shape_1/CastCastLlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shape*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	

Dlinear/linear_model/linear_model/payment_type_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ѕ
>linear/linear_model/linear_model/payment_type_xf/strided_sliceStridedSlice=linear/linear_model/linear_model/payment_type_xf/Shape_1/CastDlinear/linear_model/linear_model/payment_type_xf/strided_slice/stackFlinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_1Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

9linear/linear_model/linear_model/payment_type_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
є
7linear/linear_model/linear_model/payment_type_xf/Cast/xPack>linear/linear_model/linear_model/payment_type_xf/strided_slice9linear/linear_model/linear_model/payment_type_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
К
5linear/linear_model/linear_model/payment_type_xf/CastCast7linear/linear_model/linear_model/payment_type_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
Э
>linear/linear_model/linear_model/payment_type_xf/SparseReshapeSparseReshapeHlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indicesLlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shape5linear/linear_model/linear_model/payment_type_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
К
Glinear/linear_model/linear_model/payment_type_xf/SparseReshape/IdentityIdentity7linear/linear_model/linear_model/payment_type_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
Г
?linear/linear_model/linear_model/payment_type_xf/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
е
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/SliceSlice@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/beginHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/payment_type_xf/weighted_sum/ProdProdClinear/linear_model/linear_model/payment_type_xf/weighted_sum/SliceClinear/linear_model/linear_model/payment_type_xf/weighted_sum/Const*
	keep_dims( *

Tidx0*
T0	*
_output_shapes
: 

Nlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
ѕ
Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2GatherV2@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Nlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/indicesKlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0

Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast/xPackBlinear/linear_model/linear_model/payment_type_xf/weighted_sum/ProdFlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
г
Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshapeSparseReshape>linear/linear_model/linear_model/payment_type_xf/SparseReshape@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
з
Tlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityIdentityGlinear/linear_model/linear_model/payment_type_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Llinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Ќ
Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqualGreaterEqualTlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityLlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
Ъ
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/WhereWhereJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeReshapeClinear/linear_model/linear_model/payment_type_xf/weighted_sum/WhereKlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1GatherV2Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshapeElinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2GatherV2Tlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityElinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
Ц
Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/IdentityIdentityMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Wlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 

elinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/IdentityWlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
К
ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
М
klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
М
klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
О
clinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceelinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsilinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackklinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0*
shrink_axis_mask

Zlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/CastCastclinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0

\linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueglinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*R
_classH
FDloc:@linear/linear_model/linear_model/payment_type_xf/ReadVariableOp*
value	B : *
dtype0*
_output_shapes
: 
Ї
flinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2?linear/linear_model/linear_model/payment_type_xf/ReadVariableOp\linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Uniqueklinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*R
_classH
FDloc:@linear/linear_model/linear_model/payment_type_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

olinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityflinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
д
Ulinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumolinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identity^linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Unique:1Zlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
Ъ
Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1Reshapeglinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
и
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/ShapeShapeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Qlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:

Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Џ
Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_sliceStridedSliceClinear/linear_model/linear_model/payment_type_xf/weighted_sum/ShapeQlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stackSlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_1Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 

Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/stackPackElinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack/0Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ѕ
Blinear/linear_model/linear_model/payment_type_xf/weighted_sum/TileTileGlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
о
Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/zeros_like	ZerosLikeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
о
=linear/linear_model/linear_model/payment_type_xf/weighted_sumSelectBlinear/linear_model/linear_model/payment_type_xf/weighted_sum/TileHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/zeros_likeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
в
Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast_1Cast@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
п
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1SliceDlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast_1Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/beginJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Т
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Shape_1Shape=linear/linear_model/linear_model/payment_type_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
р
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2SliceElinear/linear_model/linear_model/payment_type_xf/weighted_sum/Shape_1Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/beginJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
у
Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/concatConcatV2Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:

Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_2Reshape=linear/linear_model/linear_model/payment_type_xf/weighted_sumDlinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ц
Glinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:
*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
valueB
*    
Ё
5linear/linear_model/pickup_latitude_xf/weights/part_0VarHandleOp*F
shared_name75linear/linear_model/pickup_latitude_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
	container *
shape
:
*
dtype0*
_output_shapes
: 
Л
Vlinear/linear_model/pickup_latitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 
Ї
<linear/linear_model/pickup_latitude_xf/weights/part_0/AssignAssignVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0Glinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zeros*
dtype0*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0

Ilinear/linear_model/pickup_latitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Blinear/linear_model/linear_model/pickup_latitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
я
>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:9Blinear/linear_model/linear_model/pickup_latitude_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	

Rlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ь
Plinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_valueCastRlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0

Llinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/NotEqualNotEqual>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDimsPlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
д
Klinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indicesWhereLlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ї
Jlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/valuesGatherNd>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDimsKlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indices*#
_output_shapes
:џџџџџџџџџ*
Tindices0	*
Tparams0	
Ј
Olinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Alinear/linear_model/linear_model/pickup_latitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ъ
?linear/linear_model/linear_model/pickup_latitude_xf/num_bucketsCastAlinear/linear_model/linear_model/pickup_latitude_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
|
:linear/linear_model/linear_model/pickup_latitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
М
8linear/linear_model/linear_model/pickup_latitude_xf/zeroCast:linear/linear_model/linear_model/pickup_latitude_xf/zero/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0
є
8linear/linear_model/linear_model/pickup_latitude_xf/LessLessJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values8linear/linear_model/linear_model/pickup_latitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

@linear/linear_model/linear_model/pickup_latitude_xf/GreaterEqualGreaterEqualJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values?linear/linear_model/linear_model/pickup_latitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ю
@linear/linear_model/linear_model/pickup_latitude_xf/out_of_range	LogicalOr8linear/linear_model/linear_model/pickup_latitude_xf/Less@linear/linear_model/linear_model/pickup_latitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
У
9linear/linear_model/linear_model/pickup_latitude_xf/ShapeShapeJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

=linear/linear_model/linear_model/pickup_latitude_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Т
;linear/linear_model/linear_model/pickup_latitude_xf/ToInt64Cast=linear/linear_model/linear_model/pickup_latitude_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Blinear/linear_model/linear_model/pickup_latitude_xf/default_valuesFill9linear/linear_model/linear_model/pickup_latitude_xf/Shape;linear/linear_model/linear_model/pickup_latitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ф
:linear/linear_model/linear_model/pickup_latitude_xf/SelectSelect@linear/linear_model/linear_model/pickup_latitude_xf/out_of_rangeBlinear/linear_model/linear_model/pickup_latitude_xf/default_valuesJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
н
@linear/linear_model/linear_model/pickup_latitude_xf/Shape_1/CastCastOlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shape*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	

Glinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Alinear/linear_model/linear_model/pickup_latitude_xf/strided_sliceStridedSlice@linear/linear_model/linear_model/pickup_latitude_xf/Shape_1/CastGlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stackIlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_1Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

<linear/linear_model/linear_model/pickup_latitude_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
§
:linear/linear_model/linear_model/pickup_latitude_xf/Cast/xPackAlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice<linear/linear_model/linear_model/pickup_latitude_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Р
8linear/linear_model/linear_model/pickup_latitude_xf/CastCast:linear/linear_model/linear_model/pickup_latitude_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
й
Alinear/linear_model/linear_model/pickup_latitude_xf/SparseReshapeSparseReshapeKlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indicesOlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shape8linear/linear_model/linear_model/pickup_latitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Р
Jlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape/IdentityIdentity:linear/linear_model/linear_model/pickup_latitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
И
Blinear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
с
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SliceSliceClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/beginKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ProdProdFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SliceFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Const*
	keep_dims( *

Tidx0*
T0	*
_output_shapes
: 

Qlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2GatherV2Clinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Qlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/indicesNlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	

Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast/xPackElinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ProdIlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
п
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshapeSparseReshapeAlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshapeClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
н
Wlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityIdentityJlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Olinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Е
Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqualGreaterEqualWlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityOlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
а
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/WhereWhereMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ё
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
Ї
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapeReshapeFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/WhereNlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1GatherV2Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshapeHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2GatherV2Wlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ь
Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/IdentityIdentityPlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Zlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 

hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/IdentityZlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
Н
llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Э
flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicehlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsllinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stacknlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0*
shrink_axis_mask

]linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/CastCastflinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ё
_linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquejlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *U
_classK
IGloc:@linear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp*
value	B : 
Ж
ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Blinear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp_linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Uniquenlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*U
_classK
IGloc:@linear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0

rlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
р
Xlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumrlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityalinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1]linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0
Ё
Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
г
Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1Reshapejlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1/shape*'
_output_shapes
:џџџџџџџџџ*
T0
*
Tshape0
о
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ShapeShapeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Tlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
О
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_sliceStridedSliceFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ShapeTlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stackVlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_1Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
Ђ
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stackPackHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack/0Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ў
Elinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/TileTileJlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0
ф
Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/zeros_like	ZerosLikeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ъ
@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sumSelectElinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/TileKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/zeros_likeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
и
Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast_1CastClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ы
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1SliceGlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast_1Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/beginMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ш
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Shape_1Shape@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
 
Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
ь
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2SliceHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Shape_1Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/beginMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
я
Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concatConcatV2Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
 
Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_2Reshape@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sumGlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zerosConst*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
valueB
*    *
dtype0*
_output_shapes

:

Є
6linear/linear_model/pickup_longitude_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *G
shared_name86linear/linear_model/pickup_longitude_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
	container *
shape
:

Н
Wlinear/linear_model/pickup_longitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/pickup_longitude_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0Hlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zeros*
dtype0*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0

Jlinear/linear_model/pickup_longitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Clinear/linear_model/linear_model/pickup_longitude_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ђ
?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:10Clinear/linear_model/linear_model/pickup_longitude_xf/ExpandDims/dim*
T0	*
_output_shapes

:(*

Tdim0

Slinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ю
Qlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0

Mlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDimsQlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value*
_output_shapes

:(*
T0	
ж
Llinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDimsLlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indices*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Tindices0	
Љ
Plinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

Blinear/linear_model/linear_model/pickup_longitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ь
@linear/linear_model/linear_model/pickup_longitude_xf/num_bucketsCastBlinear/linear_model/linear_model/pickup_longitude_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
}
;linear/linear_model/linear_model/pickup_longitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/pickup_longitude_xf/zeroCast;linear/linear_model/linear_model/pickup_longitude_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ї
9linear/linear_model/linear_model/pickup_longitude_xf/LessLessKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values9linear/linear_model/linear_model/pickup_longitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Alinear/linear_model/linear_model/pickup_longitude_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values@linear/linear_model/linear_model/pickup_longitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/pickup_longitude_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/pickup_longitude_xf/LessAlinear/linear_model/linear_model/pickup_longitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/pickup_longitude_xf/ShapeShapeKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values*
_output_shapes
:*
T0	*
out_type0

>linear/linear_model/linear_model/pickup_longitude_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ф
<linear/linear_model/linear_model/pickup_longitude_xf/ToInt64Cast>linear/linear_model/linear_model/pickup_longitude_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Clinear/linear_model/linear_model/pickup_longitude_xf/default_valuesFill:linear/linear_model/linear_model/pickup_longitude_xf/Shape<linear/linear_model/linear_model/pickup_longitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ш
;linear/linear_model/linear_model/pickup_longitude_xf/SelectSelectAlinear/linear_model/linear_model/pickup_longitude_xf/out_of_rangeClinear/linear_model/linear_model/pickup_longitude_xf/default_valuesKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
п
Alinear/linear_model/linear_model/pickup_longitude_xf/Shape_1/CastCastPlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Hlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/pickup_longitude_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/pickup_longitude_xf/Shape_1/CastHlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stackJlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

=linear/linear_model/linear_model/pickup_longitude_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ

;linear/linear_model/linear_model/pickup_longitude_xf/Cast/xPackBlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice=linear/linear_model/linear_model/pickup_longitude_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Т
9linear/linear_model/linear_model/pickup_longitude_xf/CastCast;linear/linear_model/linear_model/pickup_longitude_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
н
Blinear/linear_model/linear_model/pickup_longitude_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/pickup_longitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/pickup_longitude_xf/Select*#
_output_shapes
:џџџџџџџџџ*
T0	
К
Clinear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
х
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ConstConst*
dtype0*
_output_shapes
:*
valueB: 

Flinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SliceGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0

Rlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Rlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	

Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ProdJlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
у
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshapeDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
И
Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
в
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ђ
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Њ
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/WhereOlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0

Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ю
Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

[linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Є
ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Identity[linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
О
mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
Р
olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask 

^linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ѓ
`linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *V
_classL
JHloc:@linear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp*
value	B : 
Л
jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp`linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0

slinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
ф
Ylinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ђ
Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
ж
Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
р
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Ulinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
У
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
Ѕ
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice*
N*
_output_shapes
:*
T0*

axis 
Б
Flinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0*
T0

ц
Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ю
Alinear/linear_model/linear_model/pickup_longitude_xf/weighted_sumSelectFlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/TileLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
к
Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
я
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
№
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ѓ
Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
Ѓ
Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sumHlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ф
Flinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0*
valueB*    

4linear/linear_model/trip_start_day_xf/weights/part_0VarHandleOp*
	container *
shape
:*
dtype0*
_output_shapes
: *E
shared_name64linear/linear_model/trip_start_day_xf/weights/part_0*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0
Й
Ulinear/linear_model/trip_start_day_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 
Ѓ
;linear/linear_model/trip_start_day_xf/weights/part_0/AssignAssignVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0Flinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zeros*
dtype0*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0

Hlinear/linear_model/trip_start_day_xf/weights/part_0/Read/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0

Alinear/linear_model/linear_model/trip_start_day_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ю
=linear/linear_model/linear_model/trip_start_day_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:14Alinear/linear_model/linear_model/trip_start_day_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Qlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ъ
Olinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_valueCastQlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Klinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/NotEqualNotEqual=linear/linear_model/linear_model/trip_start_day_xf/ExpandDimsOlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value*
_output_shapes

:(*
T0	
в
Jlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indicesWhereKlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Є
Ilinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/valuesGatherNd=linear/linear_model/linear_model/trip_start_day_xf/ExpandDimsJlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indices*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Tindices0	
Ї
Nlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

@linear/linear_model/linear_model/trip_start_day_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ш
>linear/linear_model/linear_model/trip_start_day_xf/num_bucketsCast@linear/linear_model/linear_model/trip_start_day_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
{
9linear/linear_model/linear_model/trip_start_day_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
К
7linear/linear_model/linear_model/trip_start_day_xf/zeroCast9linear/linear_model/linear_model/trip_start_day_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ё
7linear/linear_model/linear_model/trip_start_day_xf/LessLessIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values7linear/linear_model/linear_model/trip_start_day_xf/zero*#
_output_shapes
:џџџџџџџџџ*
T0	

?linear/linear_model/linear_model/trip_start_day_xf/GreaterEqualGreaterEqualIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values>linear/linear_model/linear_model/trip_start_day_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ы
?linear/linear_model/linear_model/trip_start_day_xf/out_of_range	LogicalOr7linear/linear_model/linear_model/trip_start_day_xf/Less?linear/linear_model/linear_model/trip_start_day_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
С
8linear/linear_model/linear_model/trip_start_day_xf/ShapeShapeIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:
~
<linear/linear_model/linear_model/trip_start_day_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Р
:linear/linear_model/linear_model/trip_start_day_xf/ToInt64Cast<linear/linear_model/linear_model/trip_start_day_xf/ToInt64/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0
џ
Alinear/linear_model/linear_model/trip_start_day_xf/default_valuesFill8linear/linear_model/linear_model/trip_start_day_xf/Shape:linear/linear_model/linear_model/trip_start_day_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Р
9linear/linear_model/linear_model/trip_start_day_xf/SelectSelect?linear/linear_model/linear_model/trip_start_day_xf/out_of_rangeAlinear/linear_model/linear_model/trip_start_day_xf/default_valuesIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
л
?linear/linear_model/linear_model/trip_start_day_xf/Shape_1/CastCastNlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Flinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
џ
@linear/linear_model/linear_model/trip_start_day_xf/strided_sliceStridedSlice?linear/linear_model/linear_model/trip_start_day_xf/Shape_1/CastFlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stackHlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_1Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

;linear/linear_model/linear_model/trip_start_day_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
њ
9linear/linear_model/linear_model/trip_start_day_xf/Cast/xPack@linear/linear_model/linear_model/trip_start_day_xf/strided_slice;linear/linear_model/linear_model/trip_start_day_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
О
7linear/linear_model/linear_model/trip_start_day_xf/CastCast9linear/linear_model/linear_model/trip_start_day_xf/Cast/x*
Truncate( *
_output_shapes
:*

DstT0	*

SrcT0
е
@linear/linear_model/linear_model/trip_start_day_xf/SparseReshapeSparseReshapeJlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indicesNlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shape7linear/linear_model/linear_model/trip_start_day_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
О
Ilinear/linear_model/linear_model/trip_start_day_xf/SparseReshape/IdentityIdentity9linear/linear_model/linear_model/trip_start_day_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
Ж
Alinear/linear_model/linear_model/trip_start_day_xf/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:

Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
н
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SliceSliceBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/beginJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Dlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ProdProdElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SliceElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0

Plinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
§
Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2GatherV2Blinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Plinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/indicesMlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0

Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast/xPackDlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ProdHlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
л
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshapeSparseReshape@linear/linear_model/linear_model/trip_start_day_xf/SparseReshapeBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
л
Vlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityIdentityIlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape/Identity*#
_output_shapes
:џџџџџџџџџ*
T0	

Nlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
В
Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqualGreaterEqualVlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityNlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual/y*#
_output_shapes
:џџџџџџџџџ*
T0	
Ю
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/WhereWhereLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
 
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Є
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeReshapeElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/WhereMlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1GatherV2Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshapeGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ

Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2GatherV2Vlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ъ
Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/IdentityIdentityOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Ylinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 

glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/IdentityYlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
М
klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
О
mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
О
mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Ш
elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceglinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsklinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackmlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	*
shrink_axis_mask

\linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/CastCastelinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0

^linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
out_idx0*
T0	

mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *T
_classJ
HFloc:@linear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp*
value	B : 
Б
hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Alinear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp^linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Uniquemlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*T
_classJ
HFloc:@linear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

qlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityhlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
м
Wlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumqlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identity`linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Unique:1\linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ
 
Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
а
Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1Reshapeilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
м
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ShapeShapeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Slinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:

Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Й
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_sliceStridedSliceElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ShapeSlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stackUlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_1Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 

Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stackPackGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack/0Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ћ
Dlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/TileTileIlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0*
T0

т
Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/zeros_like	ZerosLikeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ц
?linear/linear_model/linear_model/trip_start_day_xf/weighted_sumSelectDlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/TileJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/zeros_likeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ж
Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast_1CastBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ч
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1SliceFlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast_1Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/beginLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ц
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Shape_1Shape?linear/linear_model/linear_model/trip_start_day_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:

Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
ш
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2SliceGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Shape_1Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/beginLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ы
Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concatConcatV2Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_2Reshape?linear/linear_model/linear_model/trip_start_day_xf/weighted_sumFlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ц
Glinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zerosConst*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
valueB*    *
dtype0*
_output_shapes

:
Ё
5linear/linear_model/trip_start_hour_xf/weights/part_0VarHandleOp*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes
: *F
shared_name75linear/linear_model/trip_start_hour_xf/weights/part_0
Л
Vlinear/linear_model/trip_start_hour_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 
Ї
<linear/linear_model/trip_start_hour_xf/weights/part_0/AssignAssignVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0Glinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zeros*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0

Ilinear/linear_model/trip_start_hour_xf/weights/part_0/Read/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:

Blinear/linear_model/linear_model/trip_start_hour_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
№
>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:15Blinear/linear_model/linear_model/trip_start_hour_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	

Rlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ь
Plinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_valueCastRlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value/x*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0

Llinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/NotEqualNotEqual>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDimsPlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value*
_output_shapes

:(*
T0	
д
Klinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indicesWhereLlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ї
Jlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/valuesGatherNd>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDimsKlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indices*#
_output_shapes
:џџџџџџџџџ*
Tindices0	*
Tparams0	
Ј
Olinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

Alinear/linear_model/linear_model/trip_start_hour_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ъ
?linear/linear_model/linear_model/trip_start_hour_xf/num_bucketsCastAlinear/linear_model/linear_model/trip_start_hour_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
|
:linear/linear_model/linear_model/trip_start_hour_xf/zero/xConst*
dtype0*
_output_shapes
: *
value	B : 
М
8linear/linear_model/linear_model/trip_start_hour_xf/zeroCast:linear/linear_model/linear_model/trip_start_hour_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
є
8linear/linear_model/linear_model/trip_start_hour_xf/LessLessJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values8linear/linear_model/linear_model/trip_start_hour_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

@linear/linear_model/linear_model/trip_start_hour_xf/GreaterEqualGreaterEqualJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values?linear/linear_model/linear_model/trip_start_hour_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ю
@linear/linear_model/linear_model/trip_start_hour_xf/out_of_range	LogicalOr8linear/linear_model/linear_model/trip_start_hour_xf/Less@linear/linear_model/linear_model/trip_start_hour_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
У
9linear/linear_model/linear_model/trip_start_hour_xf/ShapeShapeJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values*
_output_shapes
:*
T0	*
out_type0

=linear/linear_model/linear_model/trip_start_hour_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Т
;linear/linear_model/linear_model/trip_start_hour_xf/ToInt64Cast=linear/linear_model/linear_model/trip_start_hour_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Blinear/linear_model/linear_model/trip_start_hour_xf/default_valuesFill9linear/linear_model/linear_model/trip_start_hour_xf/Shape;linear/linear_model/linear_model/trip_start_hour_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ф
:linear/linear_model/linear_model/trip_start_hour_xf/SelectSelect@linear/linear_model/linear_model/trip_start_hour_xf/out_of_rangeBlinear/linear_model/linear_model/trip_start_hour_xf/default_valuesJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
н
@linear/linear_model/linear_model/trip_start_hour_xf/Shape_1/CastCastOlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shape*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	

Glinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Alinear/linear_model/linear_model/trip_start_hour_xf/strided_sliceStridedSlice@linear/linear_model/linear_model/trip_start_hour_xf/Shape_1/CastGlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stackIlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_1Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

<linear/linear_model/linear_model/trip_start_hour_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
§
:linear/linear_model/linear_model/trip_start_hour_xf/Cast/xPackAlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice<linear/linear_model/linear_model/trip_start_hour_xf/Cast/x/1*
N*
_output_shapes
:*
T0*

axis 
Р
8linear/linear_model/linear_model/trip_start_hour_xf/CastCast:linear/linear_model/linear_model/trip_start_hour_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
й
Alinear/linear_model/linear_model/trip_start_hour_xf/SparseReshapeSparseReshapeKlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indicesOlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shape8linear/linear_model/linear_model/trip_start_hour_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Р
Jlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape/IdentityIdentity:linear/linear_model/linear_model/trip_start_hour_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
И
Blinear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:

Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
с
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SliceSliceClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/beginKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ProdProdFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SliceFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0	

Qlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2GatherV2Clinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Qlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/indicesNlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0

Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast/xPackElinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ProdIlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
п
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshapeSparseReshapeAlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshapeClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
н
Wlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityIdentityJlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Olinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Е
Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqualGreaterEqualWlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityOlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
а
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/WhereWhereMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ё
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ї
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapeReshapeFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/WhereNlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1GatherV2Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshapeHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	

Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2GatherV2Wlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
Ь
Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/IdentityIdentityPlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

Zlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 

hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/IdentityZlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
Н
llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Э
flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicehlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsllinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stacknlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask 

]linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/CastCastflinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ё
_linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquejlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
out_idx0*
T0	

nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*U
_classK
IGloc:@linear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp*
value	B : *
dtype0*
_output_shapes
: 
Ж
ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Blinear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp_linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Uniquenlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0*U
_classK
IGloc:@linear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp

rlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
р
Xlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumrlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityalinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Unique:1]linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ
Ё
Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
г
Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1Reshapejlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
о
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ShapeShapeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Tlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
О
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_sliceStridedSliceFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ShapeTlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stackVlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_1Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ђ
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stackPackHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack/0Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ў
Elinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/TileTileJlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ф
Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/zeros_like	ZerosLikeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ъ
@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sumSelectElinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/TileKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/zeros_likeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
и
Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast_1CastClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ы
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1SliceGlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast_1Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/beginMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ш
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Shape_1Shape@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
 
Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
ь
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2SliceHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Shape_1Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/beginMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
я
Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concatConcatV2Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
 
Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_2Reshape@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sumGlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zerosConst*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
valueB*    *
dtype0*
_output_shapes

:
Є
6linear/linear_model/trip_start_month_xf/weights/part_0VarHandleOp*G
shared_name86linear/linear_model/trip_start_month_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes
: 
Н
Wlinear/linear_model/trip_start_month_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/trip_start_month_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0Hlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zeros*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0

Jlinear/linear_model/trip_start_month_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:

Clinear/linear_model/linear_model/trip_start_month_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ђ
?linear/linear_model/linear_model/trip_start_month_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:16Clinear/linear_model/linear_model/trip_start_month_xf/ExpandDims/dim*
T0	*
_output_shapes

:(*

Tdim0

Slinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
Qlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Mlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/trip_start_month_xf/ExpandDimsQlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
ж
Llinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/trip_start_month_xf/ExpandDimsLlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indices*#
_output_shapes
:џџџџџџџџџ*
Tindices0	*
Tparams0	
Љ
Plinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Blinear/linear_model/linear_model/trip_start_month_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ь
@linear/linear_model/linear_model/trip_start_month_xf/num_bucketsCastBlinear/linear_model/linear_model/trip_start_month_xf/num_buckets/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
}
;linear/linear_model/linear_model/trip_start_month_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/trip_start_month_xf/zeroCast;linear/linear_model/linear_model/trip_start_month_xf/zero/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
ї
9linear/linear_model/linear_model/trip_start_month_xf/LessLessKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values9linear/linear_model/linear_model/trip_start_month_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Alinear/linear_model/linear_model/trip_start_month_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values@linear/linear_model/linear_model/trip_start_month_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/trip_start_month_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/trip_start_month_xf/LessAlinear/linear_model/linear_model/trip_start_month_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/trip_start_month_xf/ShapeShapeKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

>linear/linear_model/linear_model/trip_start_month_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ф
<linear/linear_model/linear_model/trip_start_month_xf/ToInt64Cast>linear/linear_model/linear_model/trip_start_month_xf/ToInt64/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	

Clinear/linear_model/linear_model/trip_start_month_xf/default_valuesFill:linear/linear_model/linear_model/trip_start_month_xf/Shape<linear/linear_model/linear_model/trip_start_month_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ш
;linear/linear_model/linear_model/trip_start_month_xf/SelectSelectAlinear/linear_model/linear_model/trip_start_month_xf/out_of_rangeClinear/linear_model/linear_model/trip_start_month_xf/default_valuesKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values*#
_output_shapes
:џџџџџџџџџ*
T0	
п
Alinear/linear_model/linear_model/trip_start_month_xf/Shape_1/CastCastPlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Hlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Blinear/linear_model/linear_model/trip_start_month_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/trip_start_month_xf/Shape_1/CastHlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stackJlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

=linear/linear_model/linear_model/trip_start_month_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ

;linear/linear_model/linear_model/trip_start_month_xf/Cast/xPackBlinear/linear_model/linear_model/trip_start_month_xf/strided_slice=linear/linear_model/linear_model/trip_start_month_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Т
9linear/linear_model/linear_model/trip_start_month_xf/CastCast;linear/linear_model/linear_model/trip_start_month_xf/Cast/x*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
н
Blinear/linear_model/linear_model/trip_start_month_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/trip_start_month_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/trip_start_month_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/trip_start_month_xf/Select*#
_output_shapes
:џџџџџџџџџ*
T0	
К
Clinear/linear_model/linear_model/trip_start_month_xf/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:

Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
х
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/size*
Index0*
T0	*
_output_shapes
:

Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SliceGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0

Rlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Rlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	

Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ProdJlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
у
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/trip_start_month_xf/SparseReshapeDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
И
Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
в
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ђ
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Њ
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/WhereOlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0
Ю
Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

[linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Є
ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Identity[linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
О
mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
Р
olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ

^linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:џџџџџџџџџ*

DstT0
Ѓ
`linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
out_idx0*
T0	

olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *V
_classL
JHloc:@linear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp*
value	B : 
Л
jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp`linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

slinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:џџџџџџџџџ*
T0
ф
Ylinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ
Ђ
Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
ж
Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
р
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Ulinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
У
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ѕ
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Б
Flinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0*
T0

ц
Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ю
Alinear/linear_model/linear_model/trip_start_month_xf/weighted_sumSelectFlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/TileLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
к
Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
я
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/size*
Index0*
T0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
№
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/size*
Index0*
T0*
_output_shapes
:

Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ѓ
Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
Ѓ
Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/trip_start_month_xf/weighted_sumHlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ

5linear/linear_model/linear_model/weighted_sum_no_biasAddNBlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_2Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_2Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_2Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_2Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_2Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_2*
N	*'
_output_shapes
:џџџџџџџџџ*
T0
Т
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
valueB*    *
dtype0*
_output_shapes
:
ѓ
'linear/linear_model/bias_weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *8
shared_name)'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
	container *
shape:

Hlinear/linear_model/bias_weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 
я
.linear/linear_model/bias_weights/part_0/AssignAssignVariableOp'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
dtype0
л
;linear/linear_model/bias_weights/part_0/Read/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:

/linear/linear_model/bias_weights/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity/linear/linear_model/bias_weights/ReadVariableOp*
_output_shapes
:*
T0
к
-linear/linear_model/linear_model/weighted_sumBiasAdd5linear/linear_model/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
T0*
data_formatNHWC*'
_output_shapes
:џџџџџџџџџ
y
linear/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:
d
linear/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
f
linear/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
f
linear/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ѕ
linear/strided_sliceStridedSlicelinear/ReadVariableOplinear/strided_slice/stacklinear/strided_slice/stack_1linear/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
\
linear/bias/tagsConst*
dtype0*
_output_shapes
: *
valueB Blinear/bias
e
linear/biasScalarSummarylinear/bias/tagslinear/strided_slice*
T0*
_output_shapes
: 

linear/Reshape/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:
g
linear/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/ReshapeReshapelinear/Reshape/ReadVariableOplinear/Reshape/shape*
_output_shapes
:*
T0*
Tshape0

linear/Reshape_1/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/Reshape_1Reshapelinear/Reshape_1/ReadVariableOplinear/Reshape_1/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_2/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
i
linear/Reshape_2/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_2Reshapelinear/Reshape_2/ReadVariableOplinear/Reshape_2/shape*
T0*
Tshape0*
_output_shapes	
:ђ

linear/Reshape_3/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:
i
linear/Reshape_3/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_3Reshapelinear/Reshape_3/ReadVariableOplinear/Reshape_3/shape*
T0*
Tshape0*
_output_shapes
:

linear/Reshape_4/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
i
linear/Reshape_4/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/Reshape_4Reshapelinear/Reshape_4/ReadVariableOplinear/Reshape_4/shape*
_output_shapes	
:ђ*
T0*
Tshape0

linear/Reshape_5/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_5/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_5Reshapelinear/Reshape_5/ReadVariableOplinear/Reshape_5/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_6/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:
i
linear/Reshape_6/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_6Reshapelinear/Reshape_6/ReadVariableOplinear/Reshape_6/shape*
T0*
Tshape0*
_output_shapes
:

linear/Reshape_7/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_7/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/Reshape_7Reshapelinear/Reshape_7/ReadVariableOplinear/Reshape_7/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_8/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_8/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_8Reshapelinear/Reshape_8/ReadVariableOplinear/Reshape_8/shape*
T0*
Tshape0*
_output_shapes
:

T
linear/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 

linear/concatConcatV2linear/Reshapelinear/Reshape_1linear/Reshape_2linear/Reshape_3linear/Reshape_4linear/Reshape_5linear/Reshape_6linear/Reshape_7linear/Reshape_8linear/concat/axis*
T0*
N	*
_output_shapes	
:Я*

Tidx0
^
linear/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
s
linear/zero_fraction/EqualEquallinear/concatlinear/zero_fraction/zero*
_output_shapes	
:Я*
T0

linear/zero_fraction/CastCastlinear/zero_fraction/Equal*
Truncate( *
_output_shapes	
:Я*

DstT0*

SrcT0

d
linear/zero_fraction/ConstConst*
valueB: *
dtype0*
_output_shapes
:

linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

$linear/fraction_of_zero_weights/tagsConst*0
value'B% Blinear/fraction_of_zero_weights*
dtype0*
_output_shapes
: 

linear/fraction_of_zero_weightsScalarSummary$linear/fraction_of_zero_weights/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
`
linear/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ѓ
linear/zero_fraction_1/EqualEqual-linear/linear_model/linear_model/weighted_sumlinear/zero_fraction_1/zero*'
_output_shapes
:џџџџџџџџџ*
T0

linear/zero_fraction_1/CastCastlinear/zero_fraction_1/Equal*

SrcT0
*
Truncate( *'
_output_shapes
:џџџџџџџџџ*

DstT0
m
linear/zero_fraction_1/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

linear/zero_fraction_1/MeanMeanlinear/zero_fraction_1/Castlinear/zero_fraction_1/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

*linear/linear/fraction_of_zero_values/tagsConst*6
value-B+ B%linear/linear/fraction_of_zero_values*
dtype0*
_output_shapes
: 
 
%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction_1/Mean*
T0*
_output_shapes
: 
u
linear/linear/activation/tagConst*
dtype0*
_output_shapes
: *)
value B Blinear/linear/activation

linear/linear/activationHistogramSummarylinear/linear/activation/tag-linear/linear_model/linear_model/weighted_sum*
_output_shapes
: *
T0
v
addAdddnn/logits/BiasAdd-linear/linear_model/linear_model/weighted_sum*
T0*
_output_shapes

:(
n
head/predictions/logits/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:
s
1head/predictions/logits/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
c
[head/predictions/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
T
Lhead/predictions/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
R
head/predictions/logisticSigmoidadd*
T0*
_output_shapes

:(
p
head/predictions/zeros_likeConst*
dtype0*
_output_shapes

:(*
valueB(*    
q
&head/predictions/two_class_logits/axisConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
Е
!head/predictions/two_class_logitsConcatV2head/predictions/zeros_likeadd&head/predictions/two_class_logits/axis*
T0*
N*
_output_shapes

:(*

Tidx0
u
head/predictions/probabilitiesSoftmax!head/predictions/two_class_logits*
T0*
_output_shapes

:(
o
$head/predictions/class_ids/dimensionConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
Б
head/predictions/class_idsArgMax!head/predictions/two_class_logits$head/predictions/class_ids/dimension*
output_type0	*
_output_shapes
:(*

Tidx0*
T0
j
head/predictions/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ

head/predictions/ExpandDims
ExpandDimshead/predictions/class_idshead/predictions/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(
Ь
head/predictions/str_classesAsStringhead/predictions/ExpandDims*
_output_shapes

:(*
	precisionџџџџџџџџџ*
shortest( *
T0	*

fill *

scientific( *
widthџџџџџџџџџ
e
head/labels/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
 
head/labels/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:11head/labels/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	
b
head/labels/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:
d
head/labels/Shape_1Const*
valueB"(      *
dtype0*
_output_shapes
:
g
%head/labels/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
w
&head/labels/assert_rank_at_least/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:
W
Ohead/labels/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/labels/assert_rank_at_least/static_checks_determined_all_okNoOp
Ќ
head/labels/strided_slice/stackConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
З
!head/labels/strided_slice/stack_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ў
!head/labels/strided_slice/stack_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
:*
valueB:
Л
head/labels/strided_sliceStridedSlicehead/labels/Shape_1head/labels/strided_slice/stack!head/labels/strided_slice/stack_1!head/labels/strided_slice/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0
Ј
head/labels/concat/values_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:

head/labels/concat/axisConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
value	B : *
dtype0*
_output_shapes
: 
Љ
head/labels/concatConcatV2head/labels/strided_slicehead/labels/concat/values_1head/labels/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
s
head/labels/assert_equal/EqualEqualhead/labels/concathead/labels/Shape*
T0*
_output_shapes
:
Ћ
head/labels/assert_equal/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:

head/labels/assert_equal/AllAllhead/labels/assert_equal/Equalhead/labels/assert_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
Р
%head/labels/assert_equal/Assert/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*(
valueB Bexpected_labels_shape: *
dtype0*
_output_shapes
: 
Й
'head/labels/assert_equal/Assert/Const_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
Ш
-head/labels/assert_equal/Assert/Assert/data_0ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*(
valueB Bexpected_labels_shape: *
dtype0*
_output_shapes
: 
П
-head/labels/assert_equal/Assert/Assert/data_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
ѓ
&head/labels/assert_equal/Assert/AssertAsserthead/labels/assert_equal/All-head/labels/assert_equal/Assert/Assert/data_0head/labels/concat-head/labels/assert_equal/Assert/Assert/data_2head/labels/Shape*
T
2*
	summarize
Ф
head/labelsIdentityhead/labels/ExpandDims'^head/labels/assert_equal/Assert/AssertA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
T0	*
_output_shapes

:(
i
head/ToFloatCasthead/labels*

SrcT0	*
Truncate( *
_output_shapes

:(*

DstT0
\
head/assert_range/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

-head/assert_range/assert_less_equal/LessEqual	LessEqualhead/ToFloathead/assert_range/Const*
_output_shapes

:(*
T0
z
)head/assert_range/assert_less_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
Н
'head/assert_range/assert_less_equal/AllAll-head/assert_range/assert_less_equal/LessEqual)head/assert_range/assert_less_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0

0head/assert_range/assert_less_equal/Assert/ConstConst*-
value$B" BLabels must <= n_classes - 1*
dtype0*
_output_shapes
: 
Г
2head/assert_range/assert_less_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *Q
valueHBF B@Condition x <= y did not hold element-wise:x (head/ToFloat:0) = 

2head/assert_range/assert_less_equal/Assert/Const_2Const*1
value(B& B y (head/assert_range/Const:0) = *
dtype0*
_output_shapes
: 
М
=head/assert_range/assert_less_equal/Assert/AssertGuard/SwitchSwitch'head/assert_range/assert_less_equal/All'head/assert_range/assert_less_equal/All*
T0
*
_output_shapes
: : 
­
?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_tIdentity?head/assert_range/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
Ћ
?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_fIdentity=head/assert_range/assert_less_equal/Assert/AssertGuard/Switch*
_output_shapes
: *
T0


>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_idIdentity'head/assert_range/assert_less_equal/All*
_output_shapes
: *
T0


;head/assert_range/assert_less_equal/Assert/AssertGuard/NoOpNoOp@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t
Щ
Ihead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependencyIdentity?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t<^head/assert_range/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*R
_classH
FDloc:@head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
у
Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_0Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*-
value$B" BLabels must <= n_classes - 1*
dtype0*
_output_shapes
: 

Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_1Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*Q
valueHBF B@Condition x <= y did not hold element-wise:x (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
ч
Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_3Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*1
value(B& B y (head/assert_range/Const:0) = *
dtype0*
_output_shapes
: 

=head/assert_range/assert_less_equal/Assert/AssertGuard/AssertAssertDhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/SwitchDhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_0Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_1Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_3Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize

Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch'head/assert_range/assert_less_equal/All>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*:
_class0
.,loc:@head/assert_range/assert_less_equal/All*
_output_shapes
: : 
ђ
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/ToFloat>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
T0*
_class
loc:@head/ToFloat*(
_output_shapes
:(:(
ј
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switchhead/assert_range/Const>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
T0**
_class 
loc:@head/assert_range/Const*
_output_shapes
: : 
Э
Khead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency_1Identity?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f>^head/assert_range/assert_less_equal/Assert/AssertGuard/Assert*
T0
*R
_classH
FDloc:@head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 

<head/assert_range/assert_less_equal/Assert/AssertGuard/MergeMergeKhead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency_1Ihead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
p
+head/assert_range/assert_non_negative/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
В
Ahead/assert_range/assert_non_negative/assert_less_equal/LessEqual	LessEqual+head/assert_range/assert_non_negative/Consthead/ToFloat*
T0*
_output_shapes

:(

=head/assert_range/assert_non_negative/assert_less_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
љ
;head/assert_range/assert_non_negative/assert_less_equal/AllAllAhead/assert_range/assert_non_negative/assert_less_equal/LessEqual=head/assert_range/assert_non_negative/assert_less_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0

Dhead/assert_range/assert_non_negative/assert_less_equal/Assert/ConstConst*!
valueB BLabels must >= 0*
dtype0*
_output_shapes
: 
В
Fhead/assert_range/assert_non_negative/assert_less_equal/Assert/Const_1Const*<
value3B1 B+Condition x >= 0 did not hold element-wise:*
dtype0*
_output_shapes
: 

Fhead/assert_range/assert_non_negative/assert_less_equal/Assert/Const_2Const*&
valueB Bx (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
ј
Qhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/SwitchSwitch;head/assert_range/assert_non_negative/assert_less_equal/All;head/assert_range/assert_non_negative/assert_less_equal/All*
T0
*
_output_shapes
: : 
е
Shead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_tIdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
г
Shead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_fIdentityQhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 
М
Rhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_idIdentity;head/assert_range/assert_non_negative/assert_less_equal/All*
_output_shapes
: *
T0

­
Ohead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/NoOpNoOpT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t

]head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependencyIdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_tP^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*f
_class\
ZXloc:@head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
џ
Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_0ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*!
valueB BLabels must >= 0*
dtype0*
_output_shapes
: 

Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_1ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *<
value3B1 B+Condition x >= 0 did not hold element-wise:

Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_2ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*&
valueB Bx (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
П
Qhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/AssertAssertXhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/SwitchXhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_0Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_1Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_2Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1*
T
2*
	summarize
ц
Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch;head/assert_range/assert_non_negative/assert_less_equal/AllRhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0
*N
_classD
B@loc:@head/assert_range/assert_non_negative/assert_less_equal/All

Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/ToFloatRhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id*
T0*
_class
loc:@head/ToFloat*(
_output_shapes
:(:(

_head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency_1IdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_fR^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert*
_output_shapes
: *
T0
*f
_class\
ZXloc:@head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f
Х
Phead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/MergeMerge_head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency_1]head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
я
head/assert_range/IdentityIdentityhead/ToFloat=^head/assert_range/assert_less_equal/Assert/AssertGuard/MergeQ^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Merge*
_output_shapes

:(*
T0
r
head/logistic_loss/zeros_likeConst*
valueB(*    *
dtype0*
_output_shapes

:(
|
head/logistic_loss/GreaterEqualGreaterEqualaddhead/logistic_loss/zeros_like*
_output_shapes

:(*
T0

head/logistic_loss/SelectSelecthead/logistic_loss/GreaterEqualaddhead/logistic_loss/zeros_like*
T0*
_output_shapes

:(
K
head/logistic_loss/NegNegadd*
T0*
_output_shapes

:(

head/logistic_loss/Select_1Selecthead/logistic_loss/GreaterEqualhead/logistic_loss/Negadd*
T0*
_output_shapes

:(
g
head/logistic_loss/mulMuladdhead/assert_range/Identity*
_output_shapes

:(*
T0
y
head/logistic_loss/subSubhead/logistic_loss/Selecthead/logistic_loss/mul*
_output_shapes

:(*
T0
c
head/logistic_loss/ExpExphead/logistic_loss/Select_1*
T0*
_output_shapes

:(
b
head/logistic_loss/Log1pLog1phead/logistic_loss/Exp*
T0*
_output_shapes

:(
t
head/logistic_lossAddhead/logistic_loss/subhead/logistic_loss/Log1p*
T0*
_output_shapes

:(
t
/head/weighted_loss/assert_broadcastable/weightsConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
x
5head/weighted_loss/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
v
4head/weighted_loss/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

4head/weighted_loss/assert_broadcastable/values/shapeConst*
dtype0*
_output_shapes
:*
valueB"(      
u
3head/weighted_loss/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
K
Chead/weighted_loss/assert_broadcastable/static_scalar_check_successNoOp
Ї
head/weighted_loss/ToFloat/xConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
x
head/weighted_loss/MulMulhead/logistic_losshead/weighted_loss/ToFloat/x*
T0*
_output_shapes

:(
Џ
head/weighted_loss/ConstConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB"       *
dtype0*
_output_shapes
:

head/weighted_loss/SumSumhead/weighted_loss/Mulhead/weighted_loss/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
q
,metrics/label/mean/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Gmetrics/label/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Fmetrics/label/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 

Fmetrics/label/mean/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Emetrics/label/mean/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
]
Umetrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
н
4metrics/label/mean/broadcast_weights/ones_like/ShapeConstV^metrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
б
4metrics/label/mean/broadcast_weights/ones_like/ConstConstV^metrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
н
.metrics/label/mean/broadcast_weights/ones_likeFill4metrics/label/mean/broadcast_weights/ones_like/Shape4metrics/label/mean/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
В
$metrics/label/mean/broadcast_weightsMul,metrics/label/mean/broadcast_weights/weights.metrics/label/mean/broadcast_weights/ones_like*
T0*
_output_shapes

:(

*metrics/label/mean/total/Initializer/zerosConst*+
_class!
loc:@metrics/label/mean/total*
valueB
 *    *
dtype0*
_output_shapes
: 
Љ
metrics/label/mean/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@metrics/label/mean/total*
	container *
shape: 
ц
metrics/label/mean/total/AssignAssignmetrics/label/mean/total*metrics/label/mean/total/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@metrics/label/mean/total*
validate_shape(*
_output_shapes
: 

metrics/label/mean/total/readIdentitymetrics/label/mean/total*
T0*+
_class!
loc:@metrics/label/mean/total*
_output_shapes
: 

*metrics/label/mean/count/Initializer/zerosConst*+
_class!
loc:@metrics/label/mean/count*
valueB
 *    *
dtype0*
_output_shapes
: 
Љ
metrics/label/mean/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@metrics/label/mean/count*
	container *
shape: 
ц
metrics/label/mean/count/AssignAssignmetrics/label/mean/count*metrics/label/mean/count/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@metrics/label/mean/count*
validate_shape(*
_output_shapes
: 

metrics/label/mean/count/readIdentitymetrics/label/mean/count*
T0*+
_class!
loc:@metrics/label/mean/count*
_output_shapes
: 

metrics/label/mean/MulMulhead/assert_range/Identity$metrics/label/mean/broadcast_weights*
T0*
_output_shapes

:(
i
metrics/label/mean/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

metrics/label/mean/SumSum$metrics/label/mean/broadcast_weightsmetrics/label/mean/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
k
metrics/label/mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:

metrics/label/mean/Sum_1Summetrics/label/mean/Mulmetrics/label/mean/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
О
metrics/label/mean/AssignAdd	AssignAddmetrics/label/mean/totalmetrics/label/mean/Sum_1*
T0*+
_class!
loc:@metrics/label/mean/total*
_output_shapes
: *
use_locking( 
з
metrics/label/mean/AssignAdd_1	AssignAddmetrics/label/mean/countmetrics/label/mean/Sum^metrics/label/mean/Mul*
use_locking( *
T0*+
_class!
loc:@metrics/label/mean/count*
_output_shapes
: 

metrics/label/mean/truedivRealDivmetrics/label/mean/total/readmetrics/label/mean/count/read*
T0*
_output_shapes
: 
b
metrics/label/mean/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/label/mean/GreaterGreatermetrics/label/mean/count/readmetrics/label/mean/zeros_like*
_output_shapes
: *
T0

metrics/label/mean/valueSelectmetrics/label/mean/Greatermetrics/label/mean/truedivmetrics/label/mean/zeros_like*
T0*
_output_shapes
: 

metrics/label/mean/truediv_1RealDivmetrics/label/mean/AssignAddmetrics/label/mean/AssignAdd_1*
T0*
_output_shapes
: 
d
metrics/label/mean/zeros_like_1Const*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/label/mean/Greater_1Greatermetrics/label/mean/AssignAdd_1metrics/label/mean/zeros_like_1*
T0*
_output_shapes
: 
Є
metrics/label/mean/update_opSelectmetrics/label/mean/Greater_1metrics/label/mean/truediv_1metrics/label/mean/zeros_like_1*
T0*
_output_shapes
: 
 
,metrics/average_loss/total/Initializer/zerosConst*-
_class#
!loc:@metrics/average_loss/total*
valueB
 *    *
dtype0*
_output_shapes
: 
­
metrics/average_loss/total
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *-
_class#
!loc:@metrics/average_loss/total
ю
!metrics/average_loss/total/AssignAssignmetrics/average_loss/total,metrics/average_loss/total/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@metrics/average_loss/total*
validate_shape(*
_output_shapes
: 

metrics/average_loss/total/readIdentitymetrics/average_loss/total*
T0*-
_class#
!loc:@metrics/average_loss/total*
_output_shapes
: 
 
,metrics/average_loss/count/Initializer/zerosConst*-
_class#
!loc:@metrics/average_loss/count*
valueB
 *    *
dtype0*
_output_shapes
: 
­
metrics/average_loss/count
VariableV2*
shared_name *-
_class#
!loc:@metrics/average_loss/count*
	container *
shape: *
dtype0*
_output_shapes
: 
ю
!metrics/average_loss/count/AssignAssignmetrics/average_loss/count,metrics/average_loss/count/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@metrics/average_loss/count*
validate_shape(*
_output_shapes
: 

metrics/average_loss/count/readIdentitymetrics/average_loss/count*
T0*-
_class#
!loc:@metrics/average_loss/count*
_output_shapes
: 
_
metrics/average_loss/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

Imetrics/average_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Hmetrics/average_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

Hmetrics/average_loss/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Gmetrics/average_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
_
Wmetrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
с
6metrics/average_loss/broadcast_weights/ones_like/ShapeConstX^metrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
е
6metrics/average_loss/broadcast_weights/ones_like/ConstConstX^metrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
у
0metrics/average_loss/broadcast_weights/ones_likeFill6metrics/average_loss/broadcast_weights/ones_like/Shape6metrics/average_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
Є
&metrics/average_loss/broadcast_weightsMulmetrics/average_loss/Const0metrics/average_loss/broadcast_weights/ones_like*
T0*
_output_shapes

:(

metrics/average_loss/MulMulhead/logistic_loss&metrics/average_loss/broadcast_weights*
T0*
_output_shapes

:(
m
metrics/average_loss/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
Ѓ
metrics/average_loss/SumSum&metrics/average_loss/broadcast_weightsmetrics/average_loss/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
m
metrics/average_loss/Const_2Const*
dtype0*
_output_shapes
:*
valueB"       

metrics/average_loss/Sum_1Summetrics/average_loss/Mulmetrics/average_loss/Const_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
Ц
metrics/average_loss/AssignAdd	AssignAddmetrics/average_loss/totalmetrics/average_loss/Sum_1*
use_locking( *
T0*-
_class#
!loc:@metrics/average_loss/total*
_output_shapes
: 
с
 metrics/average_loss/AssignAdd_1	AssignAddmetrics/average_loss/countmetrics/average_loss/Sum^metrics/average_loss/Mul*
_output_shapes
: *
use_locking( *
T0*-
_class#
!loc:@metrics/average_loss/count

metrics/average_loss/truedivRealDivmetrics/average_loss/total/readmetrics/average_loss/count/read*
_output_shapes
: *
T0
d
metrics/average_loss/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/average_loss/GreaterGreatermetrics/average_loss/count/readmetrics/average_loss/zeros_like*
_output_shapes
: *
T0
Ђ
metrics/average_loss/valueSelectmetrics/average_loss/Greatermetrics/average_loss/truedivmetrics/average_loss/zeros_like*
T0*
_output_shapes
: 

metrics/average_loss/truediv_1RealDivmetrics/average_loss/AssignAdd metrics/average_loss/AssignAdd_1*
T0*
_output_shapes
: 
f
!metrics/average_loss/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/average_loss/Greater_1Greater metrics/average_loss/AssignAdd_1!metrics/average_loss/zeros_like_1*
T0*
_output_shapes
: 
Ќ
metrics/average_loss/update_opSelectmetrics/average_loss/Greater_1metrics/average_loss/truediv_1!metrics/average_loss/zeros_like_1*
_output_shapes
: *
T0
R
metrics/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
y
metrics/CastCasthead/predictions/ExpandDims*

SrcT0	*
Truncate( *
_output_shapes

:(*

DstT0
i
metrics/EqualEqualmetrics/Casthead/assert_range/Identity*
_output_shapes

:(*
T0
n
metrics/ToFloatCastmetrics/Equal*

SrcT0
*
Truncate( *
_output_shapes

:(*

DstT0

(metrics/accuracy/total/Initializer/zerosConst*
dtype0*
_output_shapes
: *)
_class
loc:@metrics/accuracy/total*
valueB
 *    
Ѕ
metrics/accuracy/total
VariableV2*
shared_name *)
_class
loc:@metrics/accuracy/total*
	container *
shape: *
dtype0*
_output_shapes
: 
о
metrics/accuracy/total/AssignAssignmetrics/accuracy/total(metrics/accuracy/total/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@metrics/accuracy/total*
validate_shape(*
_output_shapes
: 

metrics/accuracy/total/readIdentitymetrics/accuracy/total*
T0*)
_class
loc:@metrics/accuracy/total*
_output_shapes
: 

(metrics/accuracy/count/Initializer/zerosConst*)
_class
loc:@metrics/accuracy/count*
valueB
 *    *
dtype0*
_output_shapes
: 
Ѕ
metrics/accuracy/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *)
_class
loc:@metrics/accuracy/count*
	container *
shape: 
о
metrics/accuracy/count/AssignAssignmetrics/accuracy/count(metrics/accuracy/count/Initializer/zeros*
T0*)
_class
loc:@metrics/accuracy/count*
validate_shape(*
_output_shapes
: *
use_locking(

metrics/accuracy/count/readIdentitymetrics/accuracy/count*
T0*)
_class
loc:@metrics/accuracy/count*
_output_shapes
: 

Emetrics/accuracy/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Dmetrics/accuracy/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

Dmetrics/accuracy/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Cmetrics/accuracy/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
[
Smetrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
й
2metrics/accuracy/broadcast_weights/ones_like/ShapeConstT^metrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
Э
2metrics/accuracy/broadcast_weights/ones_like/ConstConstT^metrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
з
,metrics/accuracy/broadcast_weights/ones_likeFill2metrics/accuracy/broadcast_weights/ones_like/Shape2metrics/accuracy/broadcast_weights/ones_like/Const*
_output_shapes

:(*
T0*

index_type0

"metrics/accuracy/broadcast_weightsMulmetrics/Const,metrics/accuracy/broadcast_weights/ones_like*
T0*
_output_shapes

:(
y
metrics/accuracy/MulMulmetrics/ToFloat"metrics/accuracy/broadcast_weights*
T0*
_output_shapes

:(
g
metrics/accuracy/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

metrics/accuracy/SumSum"metrics/accuracy/broadcast_weightsmetrics/accuracy/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
metrics/accuracy/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:

metrics/accuracy/Sum_1Summetrics/accuracy/Mulmetrics/accuracy/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
Ж
metrics/accuracy/AssignAdd	AssignAddmetrics/accuracy/totalmetrics/accuracy/Sum_1*
use_locking( *
T0*)
_class
loc:@metrics/accuracy/total*
_output_shapes
: 
Э
metrics/accuracy/AssignAdd_1	AssignAddmetrics/accuracy/countmetrics/accuracy/Sum^metrics/accuracy/Mul*
T0*)
_class
loc:@metrics/accuracy/count*
_output_shapes
: *
use_locking( 
~
metrics/accuracy/truedivRealDivmetrics/accuracy/total/readmetrics/accuracy/count/read*
T0*
_output_shapes
: 
`
metrics/accuracy/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 
~
metrics/accuracy/GreaterGreatermetrics/accuracy/count/readmetrics/accuracy/zeros_like*
_output_shapes
: *
T0

metrics/accuracy/valueSelectmetrics/accuracy/Greatermetrics/accuracy/truedivmetrics/accuracy/zeros_like*
T0*
_output_shapes
: 

metrics/accuracy/truediv_1RealDivmetrics/accuracy/AssignAddmetrics/accuracy/AssignAdd_1*
T0*
_output_shapes
: 
b
metrics/accuracy/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/accuracy/Greater_1Greatermetrics/accuracy/AssignAdd_1metrics/accuracy/zeros_like_1*
T0*
_output_shapes
: 

metrics/accuracy/update_opSelectmetrics/accuracy/Greater_1metrics/accuracy/truediv_1metrics/accuracy/zeros_like_1*
T0*
_output_shapes
: 

metrics/precision/CastCasthead/predictions/ExpandDims*
Truncate( *
_output_shapes

:(*

DstT0
*

SrcT0	

metrics/precision/Cast_1Casthead/assert_range/Identity*

SrcT0*
Truncate( *
_output_shapes

:(*

DstT0

\
metrics/precision/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
j
(metrics/precision/true_positives/Equal/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z

&metrics/precision/true_positives/EqualEqualmetrics/precision/Cast_1(metrics/precision/true_positives/Equal/y*
T0
*
_output_shapes

:(
l
*metrics/precision/true_positives/Equal_1/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z

(metrics/precision/true_positives/Equal_1Equalmetrics/precision/Cast*metrics/precision/true_positives/Equal_1/y*
_output_shapes

:(*
T0

Ћ
+metrics/precision/true_positives/LogicalAnd
LogicalAnd&metrics/precision/true_positives/Equal(metrics/precision/true_positives/Equal_1*
_output_shapes

:(
W
Ometrics/precision/true_positives/assert_type/statically_determined_correct_typeNoOp
И
8metrics/precision/true_positives/count/Initializer/zerosConst*9
_class/
-+loc:@metrics/precision/true_positives/count*
valueB
 *    *
dtype0*
_output_shapes
: 
Х
&metrics/precision/true_positives/count
VariableV2*9
_class/
-+loc:@metrics/precision/true_positives/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 

-metrics/precision/true_positives/count/AssignAssign&metrics/precision/true_positives/count8metrics/precision/true_positives/count/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*9
_class/
-+loc:@metrics/precision/true_positives/count
Л
+metrics/precision/true_positives/count/readIdentity&metrics/precision/true_positives/count*
T0*9
_class/
-+loc:@metrics/precision/true_positives/count*
_output_shapes
: 
Ѕ
(metrics/precision/true_positives/ToFloatCast+metrics/precision/true_positives/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes

:(*

DstT0
g
%metrics/precision/true_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
v
4metrics/precision/true_positives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
x
5metrics/precision/true_positives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
f
^metrics/precision/true_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
h
`metrics/precision/true_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
W
Ometrics/precision/true_positives/assert_rank_in/static_checks_determined_all_okNoOp
щ
$metrics/precision/true_positives/MulMul(metrics/precision/true_positives/ToFloatmetrics/precision/ConstP^metrics/precision/true_positives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(

)metrics/precision/true_positives/IdentityIdentity+metrics/precision/true_positives/count/read*
_output_shapes
: *
T0
w
&metrics/precision/true_positives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
З
$metrics/precision/true_positives/SumSum$metrics/precision/true_positives/Mul&metrics/precision/true_positives/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
є
*metrics/precision/true_positives/AssignAdd	AssignAdd&metrics/precision/true_positives/count$metrics/precision/true_positives/Sum*
use_locking( *
T0*9
_class/
-+loc:@metrics/precision/true_positives/count*
_output_shapes
: 
k
)metrics/precision/false_positives/Equal/yConst*
value	B
 Z *
dtype0
*
_output_shapes
: 

'metrics/precision/false_positives/EqualEqualmetrics/precision/Cast_1)metrics/precision/false_positives/Equal/y*
T0
*
_output_shapes

:(
m
+metrics/precision/false_positives/Equal_1/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 
 
)metrics/precision/false_positives/Equal_1Equalmetrics/precision/Cast+metrics/precision/false_positives/Equal_1/y*
T0
*
_output_shapes

:(
Ў
,metrics/precision/false_positives/LogicalAnd
LogicalAnd'metrics/precision/false_positives/Equal)metrics/precision/false_positives/Equal_1*
_output_shapes

:(
X
Pmetrics/precision/false_positives/assert_type/statically_determined_correct_typeNoOp
К
9metrics/precision/false_positives/count/Initializer/zerosConst*:
_class0
.,loc:@metrics/precision/false_positives/count*
valueB
 *    *
dtype0*
_output_shapes
: 
Ч
'metrics/precision/false_positives/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *:
_class0
.,loc:@metrics/precision/false_positives/count*
	container *
shape: 
Ђ
.metrics/precision/false_positives/count/AssignAssign'metrics/precision/false_positives/count9metrics/precision/false_positives/count/Initializer/zeros*
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
validate_shape(*
_output_shapes
: *
use_locking(
О
,metrics/precision/false_positives/count/readIdentity'metrics/precision/false_positives/count*
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
_output_shapes
: 
Ї
)metrics/precision/false_positives/ToFloatCast,metrics/precision/false_positives/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes

:(*

DstT0
h
&metrics/precision/false_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
w
5metrics/precision/false_positives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
y
6metrics/precision/false_positives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
g
_metrics/precision/false_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
i
ametrics/precision/false_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
X
Pmetrics/precision/false_positives/assert_rank_in/static_checks_determined_all_okNoOp
ь
%metrics/precision/false_positives/MulMul)metrics/precision/false_positives/ToFloatmetrics/precision/ConstQ^metrics/precision/false_positives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(

*metrics/precision/false_positives/IdentityIdentity,metrics/precision/false_positives/count/read*
T0*
_output_shapes
: 
x
'metrics/precision/false_positives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
К
%metrics/precision/false_positives/SumSum%metrics/precision/false_positives/Mul'metrics/precision/false_positives/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
ј
+metrics/precision/false_positives/AssignAdd	AssignAdd'metrics/precision/false_positives/count%metrics/precision/false_positives/Sum*
use_locking( *
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
_output_shapes
: 

metrics/precision/addAdd)metrics/precision/true_positives/Identity*metrics/precision/false_positives/Identity*
T0*
_output_shapes
: 
`
metrics/precision/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
y
metrics/precision/GreaterGreatermetrics/precision/addmetrics/precision/Greater/y*
T0*
_output_shapes
: 

metrics/precision/add_1Add)metrics/precision/true_positives/Identity*metrics/precision/false_positives/Identity*
_output_shapes
: *
T0

metrics/precision/divRealDiv)metrics/precision/true_positives/Identitymetrics/precision/add_1*
_output_shapes
: *
T0
^
metrics/precision/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/precision/valueSelectmetrics/precision/Greatermetrics/precision/divmetrics/precision/value/e*
_output_shapes
: *
T0

metrics/precision/add_2Add*metrics/precision/true_positives/AssignAdd+metrics/precision/false_positives/AssignAdd*
T0*
_output_shapes
: 
b
metrics/precision/Greater_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/precision/Greater_1Greatermetrics/precision/add_2metrics/precision/Greater_1/y*
_output_shapes
: *
T0

metrics/precision/add_3Add*metrics/precision/true_positives/AssignAdd+metrics/precision/false_positives/AssignAdd*
T0*
_output_shapes
: 

metrics/precision/div_1RealDiv*metrics/precision/true_positives/AssignAddmetrics/precision/add_3*
T0*
_output_shapes
: 
b
metrics/precision/update_op/eConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/precision/update_opSelectmetrics/precision/Greater_1metrics/precision/div_1metrics/precision/update_op/e*
T0*
_output_shapes
: 

metrics/recall/CastCasthead/predictions/ExpandDims*

SrcT0	*
Truncate( *
_output_shapes

:(*

DstT0


metrics/recall/Cast_1Casthead/assert_range/Identity*

SrcT0*
Truncate( *
_output_shapes

:(*

DstT0

Y
metrics/recall/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
g
%metrics/recall/true_positives/Equal/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 

#metrics/recall/true_positives/EqualEqualmetrics/recall/Cast_1%metrics/recall/true_positives/Equal/y*
_output_shapes

:(*
T0

i
'metrics/recall/true_positives/Equal_1/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z

%metrics/recall/true_positives/Equal_1Equalmetrics/recall/Cast'metrics/recall/true_positives/Equal_1/y*
T0
*
_output_shapes

:(
Ђ
(metrics/recall/true_positives/LogicalAnd
LogicalAnd#metrics/recall/true_positives/Equal%metrics/recall/true_positives/Equal_1*
_output_shapes

:(
T
Lmetrics/recall/true_positives/assert_type/statically_determined_correct_typeNoOp
В
5metrics/recall/true_positives/count/Initializer/zerosConst*6
_class,
*(loc:@metrics/recall/true_positives/count*
valueB
 *    *
dtype0*
_output_shapes
: 
П
#metrics/recall/true_positives/count
VariableV2*
shared_name *6
_class,
*(loc:@metrics/recall/true_positives/count*
	container *
shape: *
dtype0*
_output_shapes
: 

*metrics/recall/true_positives/count/AssignAssign#metrics/recall/true_positives/count5metrics/recall/true_positives/count/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@metrics/recall/true_positives/count*
validate_shape(*
_output_shapes
: 
В
(metrics/recall/true_positives/count/readIdentity#metrics/recall/true_positives/count*
_output_shapes
: *
T0*6
_class,
*(loc:@metrics/recall/true_positives/count

%metrics/recall/true_positives/ToFloatCast(metrics/recall/true_positives/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes

:(*

DstT0
d
"metrics/recall/true_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
s
1metrics/recall/true_positives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
u
2metrics/recall/true_positives/assert_rank_in/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
c
[metrics/recall/true_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
e
]metrics/recall/true_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
T
Lmetrics/recall/true_positives/assert_rank_in/static_checks_determined_all_okNoOp
н
!metrics/recall/true_positives/MulMul%metrics/recall/true_positives/ToFloatmetrics/recall/ConstM^metrics/recall/true_positives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(
}
&metrics/recall/true_positives/IdentityIdentity(metrics/recall/true_positives/count/read*
T0*
_output_shapes
: 
t
#metrics/recall/true_positives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Ў
!metrics/recall/true_positives/SumSum!metrics/recall/true_positives/Mul#metrics/recall/true_positives/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
ш
'metrics/recall/true_positives/AssignAdd	AssignAdd#metrics/recall/true_positives/count!metrics/recall/true_positives/Sum*
use_locking( *
T0*6
_class,
*(loc:@metrics/recall/true_positives/count*
_output_shapes
: 
h
&metrics/recall/false_negatives/Equal/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 

$metrics/recall/false_negatives/EqualEqualmetrics/recall/Cast_1&metrics/recall/false_negatives/Equal/y*
T0
*
_output_shapes

:(
j
(metrics/recall/false_negatives/Equal_1/yConst*
value	B
 Z *
dtype0
*
_output_shapes
: 

&metrics/recall/false_negatives/Equal_1Equalmetrics/recall/Cast(metrics/recall/false_negatives/Equal_1/y*
T0
*
_output_shapes

:(
Ѕ
)metrics/recall/false_negatives/LogicalAnd
LogicalAnd$metrics/recall/false_negatives/Equal&metrics/recall/false_negatives/Equal_1*
_output_shapes

:(
U
Mmetrics/recall/false_negatives/assert_type/statically_determined_correct_typeNoOp
Д
6metrics/recall/false_negatives/count/Initializer/zerosConst*7
_class-
+)loc:@metrics/recall/false_negatives/count*
valueB
 *    *
dtype0*
_output_shapes
: 
С
$metrics/recall/false_negatives/count
VariableV2*7
_class-
+)loc:@metrics/recall/false_negatives/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 

+metrics/recall/false_negatives/count/AssignAssign$metrics/recall/false_negatives/count6metrics/recall/false_negatives/count/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count*
validate_shape(*
_output_shapes
: 
Е
)metrics/recall/false_negatives/count/readIdentity$metrics/recall/false_negatives/count*
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count*
_output_shapes
: 
Ё
&metrics/recall/false_negatives/ToFloatCast)metrics/recall/false_negatives/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes

:(*

DstT0
e
#metrics/recall/false_negatives/RankConst*
dtype0*
_output_shapes
: *
value	B :
t
2metrics/recall/false_negatives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
v
3metrics/recall/false_negatives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
d
\metrics/recall/false_negatives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
f
^metrics/recall/false_negatives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
U
Mmetrics/recall/false_negatives/assert_rank_in/static_checks_determined_all_okNoOp
р
"metrics/recall/false_negatives/MulMul&metrics/recall/false_negatives/ToFloatmetrics/recall/ConstN^metrics/recall/false_negatives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(

'metrics/recall/false_negatives/IdentityIdentity)metrics/recall/false_negatives/count/read*
T0*
_output_shapes
: 
u
$metrics/recall/false_negatives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Б
"metrics/recall/false_negatives/SumSum"metrics/recall/false_negatives/Mul$metrics/recall/false_negatives/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
ь
(metrics/recall/false_negatives/AssignAdd	AssignAdd$metrics/recall/false_negatives/count"metrics/recall/false_negatives/Sum*
_output_shapes
: *
use_locking( *
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count

metrics/recall/addAdd&metrics/recall/true_positives/Identity'metrics/recall/false_negatives/Identity*
_output_shapes
: *
T0
]
metrics/recall/Greater/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
p
metrics/recall/GreaterGreatermetrics/recall/addmetrics/recall/Greater/y*
T0*
_output_shapes
: 

metrics/recall/add_1Add&metrics/recall/true_positives/Identity'metrics/recall/false_negatives/Identity*
T0*
_output_shapes
: 
|
metrics/recall/divRealDiv&metrics/recall/true_positives/Identitymetrics/recall/add_1*
T0*
_output_shapes
: 
[
metrics/recall/value/eConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/recall/valueSelectmetrics/recall/Greatermetrics/recall/divmetrics/recall/value/e*
_output_shapes
: *
T0

metrics/recall/add_2Add'metrics/recall/true_positives/AssignAdd(metrics/recall/false_negatives/AssignAdd*
_output_shapes
: *
T0
_
metrics/recall/Greater_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
v
metrics/recall/Greater_1Greatermetrics/recall/add_2metrics/recall/Greater_1/y*
_output_shapes
: *
T0

metrics/recall/add_3Add'metrics/recall/true_positives/AssignAdd(metrics/recall/false_negatives/AssignAdd*
T0*
_output_shapes
: 

metrics/recall/div_1RealDiv'metrics/recall/true_positives/AssignAddmetrics/recall/add_3*
T0*
_output_shapes
: 
_
metrics/recall/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/recall/update_opSelectmetrics/recall/Greater_1metrics/recall/div_1metrics/recall/update_op/e*
T0*
_output_shapes
: 
v
1metrics/prediction/mean/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Lmetrics/prediction/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Kmetrics/prediction/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 

Kmetrics/prediction/mean/broadcast_weights/assert_broadcastable/values/shapeConst*
dtype0*
_output_shapes
:*
valueB"(      

Jmetrics/prediction/mean/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
b
Zmetrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ч
9metrics/prediction/mean/broadcast_weights/ones_like/ShapeConst[^metrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
л
9metrics/prediction/mean/broadcast_weights/ones_like/ConstConst[^metrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ь
3metrics/prediction/mean/broadcast_weights/ones_likeFill9metrics/prediction/mean/broadcast_weights/ones_like/Shape9metrics/prediction/mean/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
С
)metrics/prediction/mean/broadcast_weightsMul1metrics/prediction/mean/broadcast_weights/weights3metrics/prediction/mean/broadcast_weights/ones_like*
T0*
_output_shapes

:(
І
/metrics/prediction/mean/total/Initializer/zerosConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@metrics/prediction/mean/total*
valueB
 *    
Г
metrics/prediction/mean/total
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@metrics/prediction/mean/total*
	container 
њ
$metrics/prediction/mean/total/AssignAssignmetrics/prediction/mean/total/metrics/prediction/mean/total/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@metrics/prediction/mean/total*
validate_shape(*
_output_shapes
: 
 
"metrics/prediction/mean/total/readIdentitymetrics/prediction/mean/total*
T0*0
_class&
$"loc:@metrics/prediction/mean/total*
_output_shapes
: 
І
/metrics/prediction/mean/count/Initializer/zerosConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@metrics/prediction/mean/count*
valueB
 *    
Г
metrics/prediction/mean/count
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@metrics/prediction/mean/count
њ
$metrics/prediction/mean/count/AssignAssignmetrics/prediction/mean/count/metrics/prediction/mean/count/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
validate_shape(*
_output_shapes
: 
 
"metrics/prediction/mean/count/readIdentitymetrics/prediction/mean/count*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
_output_shapes
: 

metrics/prediction/mean/MulMulhead/predictions/logistic)metrics/prediction/mean/broadcast_weights*
T0*
_output_shapes

:(
n
metrics/prediction/mean/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
Њ
metrics/prediction/mean/SumSum)metrics/prediction/mean/broadcast_weightsmetrics/prediction/mean/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
p
metrics/prediction/mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
 
metrics/prediction/mean/Sum_1Summetrics/prediction/mean/Mulmetrics/prediction/mean/Const_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
в
!metrics/prediction/mean/AssignAdd	AssignAddmetrics/prediction/mean/totalmetrics/prediction/mean/Sum_1*
T0*0
_class&
$"loc:@metrics/prediction/mean/total*
_output_shapes
: *
use_locking( 
№
#metrics/prediction/mean/AssignAdd_1	AssignAddmetrics/prediction/mean/countmetrics/prediction/mean/Sum^metrics/prediction/mean/Mul*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
_output_shapes
: *
use_locking( 

metrics/prediction/mean/truedivRealDiv"metrics/prediction/mean/total/read"metrics/prediction/mean/count/read*
T0*
_output_shapes
: 
g
"metrics/prediction/mean/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/prediction/mean/GreaterGreater"metrics/prediction/mean/count/read"metrics/prediction/mean/zeros_like*
T0*
_output_shapes
: 
Ў
metrics/prediction/mean/valueSelectmetrics/prediction/mean/Greatermetrics/prediction/mean/truediv"metrics/prediction/mean/zeros_like*
T0*
_output_shapes
: 

!metrics/prediction/mean/truediv_1RealDiv!metrics/prediction/mean/AssignAdd#metrics/prediction/mean/AssignAdd_1*
T0*
_output_shapes
: 
i
$metrics/prediction/mean/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

!metrics/prediction/mean/Greater_1Greater#metrics/prediction/mean/AssignAdd_1$metrics/prediction/mean/zeros_like_1*
T0*
_output_shapes
: 
И
!metrics/prediction/mean/update_opSelect!metrics/prediction/mean/Greater_1!metrics/prediction/mean/truediv_1$metrics/prediction/mean/zeros_like_1*
T0*
_output_shapes
: 
d
metrics/accuracy_baseline/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

metrics/accuracy_baseline/subSubmetrics/accuracy_baseline/sub/xmetrics/label/mean/value*
T0*
_output_shapes
: 

metrics/accuracy_baseline/valueMaximummetrics/label/mean/valuemetrics/accuracy_baseline/sub*
T0*
_output_shapes
: 
f
!metrics/accuracy_baseline/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

metrics/accuracy_baseline/sub_1Sub!metrics/accuracy_baseline/sub_1/xmetrics/label/mean/update_op*
_output_shapes
: *
T0

#metrics/accuracy_baseline/update_opMaximummetrics/label/mean/update_opmetrics/accuracy_baseline/sub_1*
T0*
_output_shapes
: 
j
%metrics/auc/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

@metrics/auc/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

?metrics/auc/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

?metrics/auc/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

>metrics/auc/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
V
Nmetrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
Я
-metrics/auc/broadcast_weights/ones_like/ShapeConstO^metrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB"(      
У
-metrics/auc/broadcast_weights/ones_like/ConstConstO^metrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?
Ш
'metrics/auc/broadcast_weights/ones_likeFill-metrics/auc/broadcast_weights/ones_like/Shape-metrics/auc/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(

metrics/auc/broadcast_weightsMul%metrics/auc/broadcast_weights/weights'metrics/auc/broadcast_weights/ones_like*
_output_shapes

:(*
T0
W
metrics/auc/Cast/xConst*
valueB
 *    *
dtype0*
_output_shapes
: 

-metrics/auc/assert_greater_equal/GreaterEqualGreaterEqualhead/predictions/logisticmetrics/auc/Cast/x*
_output_shapes

:(*
T0
w
&metrics/auc/assert_greater_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
З
$metrics/auc/assert_greater_equal/AllAll-metrics/auc/assert_greater_equal/GreaterEqual&metrics/auc/assert_greater_equal/Const*
	keep_dims( *

Tidx0*
_output_shapes
: 

-metrics/auc/assert_greater_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
Н
/metrics/auc/assert_greater_equal/Assert/Const_1Const*^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

/metrics/auc/assert_greater_equal/Assert/Const_2Const*,
value#B! By (metrics/auc/Cast/x:0) = *
dtype0*
_output_shapes
: 
Г
:metrics/auc/assert_greater_equal/Assert/AssertGuard/SwitchSwitch$metrics/auc/assert_greater_equal/All$metrics/auc/assert_greater_equal/All*
_output_shapes
: : *
T0

Ї
<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_tIdentity<metrics/auc/assert_greater_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
Ѕ
<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_fIdentity:metrics/auc/assert_greater_equal/Assert/AssertGuard/Switch*
_output_shapes
: *
T0


;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_idIdentity$metrics/auc/assert_greater_equal/All*
T0
*
_output_shapes
: 

8metrics/auc/assert_greater_equal/Assert/AssertGuard/NoOpNoOp=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t
Н
Fmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependencyIdentity<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t9^metrics/auc/assert_greater_equal/Assert/AssertGuard/NoOp*
T0
*O
_classE
CAloc:@metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
о
Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_0Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]

Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_1Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 
м
Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_3Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*,
value#B! By (metrics/auc/Cast/x:0) = *
dtype0*
_output_shapes
: 
ћ
:metrics/auc/assert_greater_equal/Assert/AssertGuard/AssertAssertAmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/SwitchAmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_0Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_1Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_3Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize

Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/SwitchSwitch$metrics/auc/assert_greater_equal/All;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0
*7
_class-
+)loc:@metrics/auc/assert_greater_equal/All*
_output_shapes
: : 

Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logistic;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
ш
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2Switchmetrics/auc/Cast/x;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*%
_class
loc:@metrics/auc/Cast/x*
_output_shapes
: : 
С
Hmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency_1Identity<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f;^metrics/auc/assert_greater_equal/Assert/AssertGuard/Assert*
T0
*O
_classE
CAloc:@metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 

9metrics/auc/assert_greater_equal/Assert/AssertGuard/MergeMergeHmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency_1Fmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
Y
metrics/auc/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

'metrics/auc/assert_less_equal/LessEqual	LessEqualhead/predictions/logisticmetrics/auc/Cast_1/x*
_output_shapes

:(*
T0
t
#metrics/auc/assert_less_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Ћ
!metrics/auc/assert_less_equal/AllAll'metrics/auc/assert_less_equal/LessEqual#metrics/auc/assert_less_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0

*metrics/auc/assert_less_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
К
,metrics/auc/assert_less_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = 

,metrics/auc/assert_less_equal/Assert/Const_2Const*
dtype0*
_output_shapes
: *.
value%B# By (metrics/auc/Cast_1/x:0) = 
Њ
7metrics/auc/assert_less_equal/Assert/AssertGuard/SwitchSwitch!metrics/auc/assert_less_equal/All!metrics/auc/assert_less_equal/All*
_output_shapes
: : *
T0

Ё
9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_tIdentity9metrics/auc/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 

9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_fIdentity7metrics/auc/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 

8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_idIdentity!metrics/auc/assert_less_equal/All*
_output_shapes
: *
T0

y
5metrics/auc/assert_less_equal/Assert/AssertGuard/NoOpNoOp:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t
Б
Cmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependencyIdentity9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t6^metrics/auc/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*L
_classB
@>loc:@metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
и
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_0Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 

>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_1Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = 
и
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_3Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# By (metrics/auc/Cast_1/x:0) = 
ц
7metrics/auc/assert_less_equal/Assert/AssertGuard/AssertAssert>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_0>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_1@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_3@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
ў
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch!metrics/auc/assert_less_equal/All8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*4
_class*
(&loc:@metrics/auc/assert_less_equal/All*
_output_shapes
: : 

@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logistic8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
ц
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switchmetrics/auc/Cast_1/x8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
T0*'
_class
loc:@metrics/auc/Cast_1/x*
_output_shapes
: : 
Е
Emetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency_1Identity9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f8^metrics/auc/assert_less_equal/Assert/AssertGuard/Assert*
_output_shapes
: *
T0
*L
_classB
@>loc:@metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f
ї
6metrics/auc/assert_less_equal/Assert/AssertGuard/MergeMergeEmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency_1Cmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
ѓ
metrics/auc/Cast_2Casthead/assert_range/Identity:^metrics/auc/assert_greater_equal/Assert/AssertGuard/Merge7^metrics/auc/assert_less_equal/Assert/AssertGuard/Merge*

SrcT0*
Truncate( *
_output_shapes

:(*

DstT0

j
metrics/auc/Reshape/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:

metrics/auc/ReshapeReshapehead/predictions/logisticmetrics/auc/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(
l
metrics/auc/Reshape_1/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:

metrics/auc/Reshape_1Reshapemetrics/auc/Cast_2metrics/auc/Reshape_1/shape*
T0
*
Tshape0*
_output_shapes

:(

metrics/auc/ConstConst*
dtype0*
_output_shapes	
:Ш*Й
valueЏBЌШ" ПжГЯЉЄ;ЯЉ$<Зўv<ЯЉЄ<CдЭ<Зўі<=ЯЉ$=	?9=CдM=}ib=Зўv=јЩ==2_=ЯЉЄ=lєЎ=	?Й=ІУ=CдЭ=ри=}iт=Дь=Зўі=ЊЄ >јЩ>Gя
>>ф9>2_>>ЯЉ$>Я)>lє.>Л4>	?9>Wd>>ІC>єЎH>CдM>љR>рX>.D]>}ib>Ыg>Дl>hйq>Зўv>$|>ЊЄ>Q7>јЩ> \>Gя>ю>><Ї>ф9>Ь>2_>йё>>(Ђ>ЯЉЄ>v<Ї>ЯЉ>ХaЌ>lєЎ>Б>ЛД>bЌЖ>	?Й>АбЛ>WdО>џіР>ІУ>MЦ>єЎШ>AЫ>CдЭ>ъfа>љв>9е>ри>Бк>.Dн>жжп>}iт>$ќф>Ыч>r!ъ>Дь>СFя>hйё>lє>Зўі>^љ>$ќ>ЌЖў>ЊЄ ?§э?Q7?Ѕ?јЩ?L? \?ѓЅ	?Gя
?8?ю?BЫ??щ]?<Ї?№?ф9?7?Ь?п?2_?Ј?йё?-;??дЭ ?("?{`#?ЯЉ$?#ѓ%?v<'?Ъ(?Я)?q+?Хa,?Ћ-?lє.?Р=0?1?gа2?Л4?c5?bЌ6?Еѕ7?	?9?]:?Аб;?=?Wd>?Ћ­??џі@?R@B?ІC?њвD?MF?ЁeG?єЎH?HјI?AK?яL?CдM?O?ъfP?>АQ?љR?хBT?9U?еV?рX?3hY?БZ?лњ[?.D]?^?жж_?) a?}ib?аВc?$ќd?xEf?Ыg?иh?r!j?Цjk?Дl?m§m?СFo?p?hйq?М"s?lt?cЕu?Зўv?
Hx?^y?Вкz?$|?Ym}?ЌЖ~? ?
d
metrics/auc/ExpandDims/dimConst*
valueB:*
dtype0*
_output_shapes
:

metrics/auc/ExpandDims
ExpandDimsmetrics/auc/Constmetrics/auc/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:	Ш
b
metrics/auc/stackConst*
valueB"   (   *
dtype0*
_output_shapes
:

metrics/auc/TileTilemetrics/auc/ExpandDimsmetrics/auc/stack*
_output_shapes
:	Ш(*

Tmultiples0*
T0
X
metrics/auc/transpose/RankRankmetrics/auc/Reshape*
T0*
_output_shapes
: 
]
metrics/auc/transpose/sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
z
metrics/auc/transpose/subSubmetrics/auc/transpose/Rankmetrics/auc/transpose/sub/y*
_output_shapes
: *
T0
c
!metrics/auc/transpose/Range/startConst*
value	B : *
dtype0*
_output_shapes
: 
c
!metrics/auc/transpose/Range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
З
metrics/auc/transpose/RangeRange!metrics/auc/transpose/Range/startmetrics/auc/transpose/Rank!metrics/auc/transpose/Range/delta*#
_output_shapes
:џџџџџџџџџ*

Tidx0

metrics/auc/transpose/sub_1Submetrics/auc/transpose/submetrics/auc/transpose/Range*
T0*#
_output_shapes
:џџџџџџџџџ

metrics/auc/transpose	Transposemetrics/auc/Reshapemetrics/auc/transpose/sub_1*
Tperm0*
T0*
_output_shapes

:(
m
metrics/auc/Tile_1/multiplesConst*
dtype0*
_output_shapes
:*
valueB"Ш      

metrics/auc/Tile_1Tilemetrics/auc/transposemetrics/auc/Tile_1/multiples*
T0*
_output_shapes
:	Ш(*

Tmultiples0
n
metrics/auc/GreaterGreatermetrics/auc/Tile_1metrics/auc/Tile*
T0*
_output_shapes
:	Ш(
Z
metrics/auc/LogicalNot
LogicalNotmetrics/auc/Greater*
_output_shapes
:	Ш(
m
metrics/auc/Tile_2/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:

metrics/auc/Tile_2Tilemetrics/auc/Reshape_1metrics/auc/Tile_2/multiples*
T0
*
_output_shapes
:	Ш(*

Tmultiples0
[
metrics/auc/LogicalNot_1
LogicalNotmetrics/auc/Tile_2*
_output_shapes
:	Ш(
l
metrics/auc/Reshape_2/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:

metrics/auc/Reshape_2Reshapemetrics/auc/broadcast_weightsmetrics/auc/Reshape_2/shape*
T0*
Tshape0*
_output_shapes

:(
m
metrics/auc/Tile_3/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:

metrics/auc/Tile_3Tilemetrics/auc/Reshape_2metrics/auc/Tile_3/multiples*

Tmultiples0*
T0*
_output_shapes
:	Ш(
Њ
,metrics/auc/true_positives/Initializer/zerosConst*-
_class#
!loc:@metrics/auc/true_positives*
valueBШ*    *
dtype0*
_output_shapes	
:Ш
З
metrics/auc/true_positives
VariableV2*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш*
shared_name *-
_class#
!loc:@metrics/auc/true_positives
ѓ
!metrics/auc/true_positives/AssignAssignmetrics/auc/true_positives,metrics/auc/true_positives/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@metrics/auc/true_positives*
validate_shape(*
_output_shapes	
:Ш

metrics/auc/true_positives/readIdentitymetrics/auc/true_positives*
T0*-
_class#
!loc:@metrics/auc/true_positives*
_output_shapes	
:Ш
n
metrics/auc/LogicalAnd
LogicalAndmetrics/auc/Tile_2metrics/auc/Greater*
_output_shapes
:	Ш(
|
metrics/auc/ToFloatCastmetrics/auc/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes
:	Ш(*

DstT0
i
metrics/auc/mulMulmetrics/auc/ToFloatmetrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
c
!metrics/auc/Sum/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/SumSummetrics/auc/mul!metrics/auc/Sum/reduction_indices*
T0*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0
З
metrics/auc/AssignAdd	AssignAddmetrics/auc/true_positivesmetrics/auc/Sum*
T0*-
_class#
!loc:@metrics/auc/true_positives*
_output_shapes	
:Ш*
use_locking( 
Ќ
-metrics/auc/false_negatives/Initializer/zerosConst*.
_class$
" loc:@metrics/auc/false_negatives*
valueBШ*    *
dtype0*
_output_shapes	
:Ш
Й
metrics/auc/false_negatives
VariableV2*
shared_name *.
_class$
" loc:@metrics/auc/false_negatives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
ї
"metrics/auc/false_negatives/AssignAssignmetrics/auc/false_negatives-metrics/auc/false_negatives/Initializer/zeros*
use_locking(*
T0*.
_class$
" loc:@metrics/auc/false_negatives*
validate_shape(*
_output_shapes	
:Ш

 metrics/auc/false_negatives/readIdentitymetrics/auc/false_negatives*
T0*.
_class$
" loc:@metrics/auc/false_negatives*
_output_shapes	
:Ш
s
metrics/auc/LogicalAnd_1
LogicalAndmetrics/auc/Tile_2metrics/auc/LogicalNot*
_output_shapes
:	Ш(

metrics/auc/ToFloat_1Castmetrics/auc/LogicalAnd_1*
Truncate( *
_output_shapes
:	Ш(*

DstT0*

SrcT0

m
metrics/auc/mul_1Mulmetrics/auc/ToFloat_1metrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
e
#metrics/auc/Sum_1/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_1Summetrics/auc/mul_1#metrics/auc/Sum_1/reduction_indices*
	keep_dims( *

Tidx0*
T0*
_output_shapes	
:Ш
Н
metrics/auc/AssignAdd_1	AssignAddmetrics/auc/false_negativesmetrics/auc/Sum_1*
use_locking( *
T0*.
_class$
" loc:@metrics/auc/false_negatives*
_output_shapes	
:Ш
Њ
,metrics/auc/true_negatives/Initializer/zerosConst*-
_class#
!loc:@metrics/auc/true_negatives*
valueBШ*    *
dtype0*
_output_shapes	
:Ш
З
metrics/auc/true_negatives
VariableV2*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш*
shared_name *-
_class#
!loc:@metrics/auc/true_negatives
ѓ
!metrics/auc/true_negatives/AssignAssignmetrics/auc/true_negatives,metrics/auc/true_negatives/Initializer/zeros*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(

metrics/auc/true_negatives/readIdentitymetrics/auc/true_negatives*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
_output_shapes	
:Ш
y
metrics/auc/LogicalAnd_2
LogicalAndmetrics/auc/LogicalNot_1metrics/auc/LogicalNot*
_output_shapes
:	Ш(

metrics/auc/ToFloat_2Castmetrics/auc/LogicalAnd_2*

SrcT0
*
Truncate( *
_output_shapes
:	Ш(*

DstT0
m
metrics/auc/mul_2Mulmetrics/auc/ToFloat_2metrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
e
#metrics/auc/Sum_2/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_2Summetrics/auc/mul_2#metrics/auc/Sum_2/reduction_indices*
T0*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0
Л
metrics/auc/AssignAdd_2	AssignAddmetrics/auc/true_negativesmetrics/auc/Sum_2*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
_output_shapes	
:Ш*
use_locking( 
Ќ
-metrics/auc/false_positives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*.
_class$
" loc:@metrics/auc/false_positives*
valueBШ*    
Й
metrics/auc/false_positives
VariableV2*
dtype0*
_output_shapes	
:Ш*
shared_name *.
_class$
" loc:@metrics/auc/false_positives*
	container *
shape:Ш
ї
"metrics/auc/false_positives/AssignAssignmetrics/auc/false_positives-metrics/auc/false_positives/Initializer/zeros*
T0*.
_class$
" loc:@metrics/auc/false_positives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(

 metrics/auc/false_positives/readIdentitymetrics/auc/false_positives*
_output_shapes	
:Ш*
T0*.
_class$
" loc:@metrics/auc/false_positives
v
metrics/auc/LogicalAnd_3
LogicalAndmetrics/auc/LogicalNot_1metrics/auc/Greater*
_output_shapes
:	Ш(

metrics/auc/ToFloat_3Castmetrics/auc/LogicalAnd_3*
Truncate( *
_output_shapes
:	Ш(*

DstT0*

SrcT0

m
metrics/auc/mul_3Mulmetrics/auc/ToFloat_3metrics/auc/Tile_3*
_output_shapes
:	Ш(*
T0
e
#metrics/auc/Sum_3/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_3Summetrics/auc/mul_3#metrics/auc/Sum_3/reduction_indices*
	keep_dims( *

Tidx0*
T0*
_output_shapes	
:Ш
Н
metrics/auc/AssignAdd_3	AssignAddmetrics/auc/false_positivesmetrics/auc/Sum_3*
T0*.
_class$
" loc:@metrics/auc/false_positives*
_output_shapes	
:Ш*
use_locking( 
V
metrics/auc/add/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
p
metrics/auc/addAddmetrics/auc/true_positives/readmetrics/auc/add/y*
T0*
_output_shapes	
:Ш

metrics/auc/add_1Addmetrics/auc/true_positives/read metrics/auc/false_negatives/read*
T0*
_output_shapes	
:Ш
X
metrics/auc/add_2/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
f
metrics/auc/add_2Addmetrics/auc/add_1metrics/auc/add_2/y*
T0*
_output_shapes	
:Ш
d
metrics/auc/divRealDivmetrics/auc/addmetrics/auc/add_2*
_output_shapes	
:Ш*
T0

metrics/auc/add_3Add metrics/auc/false_positives/readmetrics/auc/true_negatives/read*
T0*
_output_shapes	
:Ш
X
metrics/auc/add_4/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
f
metrics/auc/add_4Addmetrics/auc/add_3metrics/auc/add_4/y*
T0*
_output_shapes	
:Ш
w
metrics/auc/div_1RealDiv metrics/auc/false_positives/readmetrics/auc/add_4*
T0*
_output_shapes	
:Ш
i
metrics/auc/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
!metrics/auc/strided_slice/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
k
!metrics/auc/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
К
metrics/auc/strided_sliceStridedSlicemetrics/auc/div_1metrics/auc/strided_slice/stack!metrics/auc/strided_slice/stack_1!metrics/auc/strided_slice/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_1/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_1StridedSlicemetrics/auc/div_1!metrics/auc/strided_slice_1/stack#metrics/auc/strided_slice_1/stack_1#metrics/auc/strided_slice_1/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
t
metrics/auc/subSubmetrics/auc/strided_slicemetrics/auc/strided_slice_1*
T0*
_output_shapes	
:Ч
k
!metrics/auc/strided_slice_2/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
#metrics/auc/strided_slice_2/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Р
metrics/auc/strided_slice_2StridedSlicemetrics/auc/div!metrics/auc/strided_slice_2/stack#metrics/auc/strided_slice_2/stack_1#metrics/auc/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч
k
!metrics/auc/strided_slice_3/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_3/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_3/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Р
metrics/auc/strided_slice_3StridedSlicemetrics/auc/div!metrics/auc/strided_slice_3/stack#metrics/auc/strided_slice_3/stack_1#metrics/auc/strided_slice_3/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
x
metrics/auc/add_5Addmetrics/auc/strided_slice_2metrics/auc/strided_slice_3*
T0*
_output_shapes	
:Ч
Z
metrics/auc/truediv/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
n
metrics/auc/truedivRealDivmetrics/auc/add_5metrics/auc/truediv/y*
T0*
_output_shapes	
:Ч
d
metrics/auc/Mul_4Mulmetrics/auc/submetrics/auc/truediv*
T0*
_output_shapes	
:Ч
]
metrics/auc/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
~
metrics/auc/valueSummetrics/auc/Mul_4metrics/auc/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
X
metrics/auc/add_6/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
j
metrics/auc/add_6Addmetrics/auc/AssignAddmetrics/auc/add_6/y*
T0*
_output_shapes	
:Ш
n
metrics/auc/add_7Addmetrics/auc/AssignAddmetrics/auc/AssignAdd_1*
T0*
_output_shapes	
:Ш
X
metrics/auc/add_8/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
f
metrics/auc/add_8Addmetrics/auc/add_7metrics/auc/add_8/y*
T0*
_output_shapes	
:Ш
h
metrics/auc/div_2RealDivmetrics/auc/add_6metrics/auc/add_8*
T0*
_output_shapes	
:Ш
p
metrics/auc/add_9Addmetrics/auc/AssignAdd_3metrics/auc/AssignAdd_2*
_output_shapes	
:Ш*
T0
Y
metrics/auc/add_10/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
h
metrics/auc/add_10Addmetrics/auc/add_9metrics/auc/add_10/y*
T0*
_output_shapes	
:Ш
o
metrics/auc/div_3RealDivmetrics/auc/AssignAdd_3metrics/auc/add_10*
_output_shapes	
:Ш*
T0
k
!metrics/auc/strided_slice_4/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
#metrics/auc/strided_slice_4/stack_1Const*
dtype0*
_output_shapes
:*
valueB:Ч
m
#metrics/auc/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_4StridedSlicemetrics/auc/div_3!metrics/auc/strided_slice_4/stack#metrics/auc/strided_slice_4/stack_1#metrics/auc/strided_slice_4/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_5/stackConst*
dtype0*
_output_shapes
:*
valueB:
m
#metrics/auc/strided_slice_5/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_5/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Т
metrics/auc/strided_slice_5StridedSlicemetrics/auc/div_3!metrics/auc/strided_slice_5/stack#metrics/auc/strided_slice_5/stack_1#metrics/auc/strided_slice_5/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч
x
metrics/auc/sub_1Submetrics/auc/strided_slice_4metrics/auc/strided_slice_5*
T0*
_output_shapes	
:Ч
k
!metrics/auc/strided_slice_6/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
#metrics/auc/strided_slice_6/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_6/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Т
metrics/auc/strided_slice_6StridedSlicemetrics/auc/div_2!metrics/auc/strided_slice_6/stack#metrics/auc/strided_slice_6/stack_1#metrics/auc/strided_slice_6/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_7/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_7/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_7/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_7StridedSlicemetrics/auc/div_2!metrics/auc/strided_slice_7/stack#metrics/auc/strided_slice_7/stack_1#metrics/auc/strided_slice_7/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
y
metrics/auc/add_11Addmetrics/auc/strided_slice_6metrics/auc/strided_slice_7*
T0*
_output_shapes	
:Ч
\
metrics/auc/truediv_1/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
s
metrics/auc/truediv_1RealDivmetrics/auc/add_11metrics/auc/truediv_1/y*
_output_shapes	
:Ч*
T0
h
metrics/auc/Mul_5Mulmetrics/auc/sub_1metrics/auc/truediv_1*
T0*
_output_shapes	
:Ч
]
metrics/auc/Const_2Const*
valueB: *
dtype0*
_output_shapes
:

metrics/auc/update_opSummetrics/auc/Mul_5metrics/auc/Const_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
{
6metrics/auc_precision_recall/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Qmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Pmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 
Ё
Pmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/values/shapeConst*
dtype0*
_output_shapes
:*
valueB"(      

Ometrics/auc_precision_recall/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
g
_metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ё
>metrics/auc_precision_recall/broadcast_weights/ones_like/ShapeConst`^metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
х
>metrics/auc_precision_recall/broadcast_weights/ones_like/ConstConst`^metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ћ
8metrics/auc_precision_recall/broadcast_weights/ones_likeFill>metrics/auc_precision_recall/broadcast_weights/ones_like/Shape>metrics/auc_precision_recall/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
а
.metrics/auc_precision_recall/broadcast_weightsMul6metrics/auc_precision_recall/broadcast_weights/weights8metrics/auc_precision_recall/broadcast_weights/ones_like*
T0*
_output_shapes

:(
h
#metrics/auc_precision_recall/Cast/xConst*
valueB
 *    *
dtype0*
_output_shapes
: 
З
>metrics/auc_precision_recall/assert_greater_equal/GreaterEqualGreaterEqualhead/predictions/logistic#metrics/auc_precision_recall/Cast/x*
T0*
_output_shapes

:(

7metrics/auc_precision_recall/assert_greater_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
ъ
5metrics/auc_precision_recall/assert_greater_equal/AllAll>metrics/auc_precision_recall/assert_greater_equal/GreaterEqual7metrics/auc_precision_recall/assert_greater_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0

>metrics/auc_precision_recall/assert_greater_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
Ю
@metrics/auc_precision_recall/assert_greater_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = 
­
@metrics/auc_precision_recall/assert_greater_equal/Assert/Const_2Const*=
value4B2 B,y (metrics/auc_precision_recall/Cast/x:0) = *
dtype0*
_output_shapes
: 
ц
Kmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/SwitchSwitch5metrics/auc_precision_recall/assert_greater_equal/All5metrics/auc_precision_recall/assert_greater_equal/All*
T0
*
_output_shapes
: : 
Щ
Mmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_tIdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
Ч
Mmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_fIdentityKmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 
А
Lmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_idIdentity5metrics/auc_precision_recall/assert_greater_equal/All*
_output_shapes
: *
T0

Ё
Imetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/NoOpNoOpN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t

Wmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependencyIdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_tJ^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/NoOp*
T0
*`
_classV
TRloc:@metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 

Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_0ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
А
Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_1ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_3ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*=
value4B2 B,y (metrics/auc_precision_recall/Cast/x:0) = *
dtype0*
_output_shapes
: 
ђ
Kmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/AssertAssertRmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/SwitchRmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_0Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_1Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_3Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
Ю
Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/SwitchSwitch5metrics/auc_precision_recall/assert_greater_equal/AllLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
T0
*H
_class>
<:loc:@metrics/auc_precision_recall/assert_greater_equal/All*
_output_shapes
: : 
Ј
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logisticLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
Ќ
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2Switch#metrics/auc_precision_recall/Cast/xLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*6
_class,
*(loc:@metrics/auc_precision_recall/Cast/x*
_output_shapes
: : 

Ymetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency_1IdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_fL^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert*
T0
*`
_classV
TRloc:@metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
Г
Jmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/MergeMergeYmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency_1Wmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
j
%metrics/auc_precision_recall/Cast_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
А
8metrics/auc_precision_recall/assert_less_equal/LessEqual	LessEqualhead/predictions/logistic%metrics/auc_precision_recall/Cast_1/x*
T0*
_output_shapes

:(

4metrics/auc_precision_recall/assert_less_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
о
2metrics/auc_precision_recall/assert_less_equal/AllAll8metrics/auc_precision_recall/assert_less_equal/LessEqual4metrics/auc_precision_recall/assert_less_equal/Const*
	keep_dims( *

Tidx0*
_output_shapes
: 

;metrics/auc_precision_recall/assert_less_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
Ы
=metrics/auc_precision_recall/assert_less_equal/Assert/Const_1Const*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 
Ќ
=metrics/auc_precision_recall/assert_less_equal/Assert/Const_2Const*?
value6B4 B.y (metrics/auc_precision_recall/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
н
Hmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/SwitchSwitch2metrics/auc_precision_recall/assert_less_equal/All2metrics/auc_precision_recall/assert_less_equal/All*
T0
*
_output_shapes
: : 
У
Jmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_tIdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
С
Jmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_fIdentityHmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 
Њ
Imetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_idIdentity2metrics/auc_precision_recall/assert_less_equal/All*
T0
*
_output_shapes
: 

Fmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/NoOpNoOpK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t
ѕ
Tmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependencyIdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_tG^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*]
_classS
QOloc:@metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
њ
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_0ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
Њ
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_1ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_3ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*?
value6B4 B.y (metrics/auc_precision_recall/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
н
Hmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/AssertAssertOmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/SwitchOmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_0Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_1Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_3Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
Т
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch2metrics/auc_precision_recall/assert_less_equal/AllImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*E
_class;
97loc:@metrics/auc_precision_recall/assert_less_equal/All*
_output_shapes
: : 
Ђ
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logisticImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
Њ
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switch%metrics/auc_precision_recall/Cast_1/xImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
T0*8
_class.
,*loc:@metrics/auc_precision_recall/Cast_1/x*
_output_shapes
: : 
љ
Vmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency_1IdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_fI^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert*
T0
*]
_classS
QOloc:@metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
Њ
Gmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/MergeMergeVmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency_1Tmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
І
#metrics/auc_precision_recall/Cast_2Casthead/assert_range/IdentityK^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/MergeH^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Merge*

SrcT0*
Truncate( *
_output_shapes

:(*

DstT0

{
*metrics/auc_precision_recall/Reshape/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
­
$metrics/auc_precision_recall/ReshapeReshapehead/predictions/logistic*metrics/auc_precision_recall/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(
}
,metrics/auc_precision_recall/Reshape_1/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:
Л
&metrics/auc_precision_recall/Reshape_1Reshape#metrics/auc_precision_recall/Cast_2,metrics/auc_precision_recall/Reshape_1/shape*
T0
*
Tshape0*
_output_shapes

:(

"metrics/auc_precision_recall/ConstConst*Й
valueЏBЌШ" ПжГЯЉЄ;ЯЉ$<Зўv<ЯЉЄ<CдЭ<Зўі<=ЯЉ$=	?9=CдM=}ib=Зўv=јЩ==2_=ЯЉЄ=lєЎ=	?Й=ІУ=CдЭ=ри=}iт=Дь=Зўі=ЊЄ >јЩ>Gя
>>ф9>2_>>ЯЉ$>Я)>lє.>Л4>	?9>Wd>>ІC>єЎH>CдM>љR>рX>.D]>}ib>Ыg>Дl>hйq>Зўv>$|>ЊЄ>Q7>јЩ> \>Gя>ю>><Ї>ф9>Ь>2_>йё>>(Ђ>ЯЉЄ>v<Ї>ЯЉ>ХaЌ>lєЎ>Б>ЛД>bЌЖ>	?Й>АбЛ>WdО>џіР>ІУ>MЦ>єЎШ>AЫ>CдЭ>ъfа>љв>9е>ри>Бк>.Dн>жжп>}iт>$ќф>Ыч>r!ъ>Дь>СFя>hйё>lє>Зўі>^љ>$ќ>ЌЖў>ЊЄ ?§э?Q7?Ѕ?јЩ?L? \?ѓЅ	?Gя
?8?ю?BЫ??щ]?<Ї?№?ф9?7?Ь?п?2_?Ј?йё?-;??дЭ ?("?{`#?ЯЉ$?#ѓ%?v<'?Ъ(?Я)?q+?Хa,?Ћ-?lє.?Р=0?1?gа2?Л4?c5?bЌ6?Еѕ7?	?9?]:?Аб;?=?Wd>?Ћ­??џі@?R@B?ІC?њвD?MF?ЁeG?єЎH?HјI?AK?яL?CдM?O?ъfP?>АQ?љR?хBT?9U?еV?рX?3hY?БZ?лњ[?.D]?^?жж_?) a?}ib?аВc?$ќd?xEf?Ыg?иh?r!j?Цjk?Дl?m§m?СFo?p?hйq?М"s?lt?cЕu?Зўv?
Hx?^y?Вкz?$|?Ym}?ЌЖ~? ?*
dtype0*
_output_shapes	
:Ш
u
+metrics/auc_precision_recall/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
М
'metrics/auc_precision_recall/ExpandDims
ExpandDims"metrics/auc_precision_recall/Const+metrics/auc_precision_recall/ExpandDims/dim*
_output_shapes
:	Ш*

Tdim0*
T0
s
"metrics/auc_precision_recall/stackConst*
valueB"   (   *
dtype0*
_output_shapes
:
В
!metrics/auc_precision_recall/TileTile'metrics/auc_precision_recall/ExpandDims"metrics/auc_precision_recall/stack*

Tmultiples0*
T0*
_output_shapes
:	Ш(
z
+metrics/auc_precision_recall/transpose/RankRank$metrics/auc_precision_recall/Reshape*
T0*
_output_shapes
: 
n
,metrics/auc_precision_recall/transpose/sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
­
*metrics/auc_precision_recall/transpose/subSub+metrics/auc_precision_recall/transpose/Rank,metrics/auc_precision_recall/transpose/sub/y*
T0*
_output_shapes
: 
t
2metrics/auc_precision_recall/transpose/Range/startConst*
value	B : *
dtype0*
_output_shapes
: 
t
2metrics/auc_precision_recall/transpose/Range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
ћ
,metrics/auc_precision_recall/transpose/RangeRange2metrics/auc_precision_recall/transpose/Range/start+metrics/auc_precision_recall/transpose/Rank2metrics/auc_precision_recall/transpose/Range/delta*#
_output_shapes
:џџџџџџџџџ*

Tidx0
Л
,metrics/auc_precision_recall/transpose/sub_1Sub*metrics/auc_precision_recall/transpose/sub,metrics/auc_precision_recall/transpose/Range*
T0*#
_output_shapes
:џџџџџџџџџ
Н
&metrics/auc_precision_recall/transpose	Transpose$metrics/auc_precision_recall/Reshape,metrics/auc_precision_recall/transpose/sub_1*
T0*
_output_shapes

:(*
Tperm0
~
-metrics/auc_precision_recall/Tile_1/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_1Tile&metrics/auc_precision_recall/transpose-metrics/auc_precision_recall/Tile_1/multiples*

Tmultiples0*
T0*
_output_shapes
:	Ш(
Ё
$metrics/auc_precision_recall/GreaterGreater#metrics/auc_precision_recall/Tile_1!metrics/auc_precision_recall/Tile*
T0*
_output_shapes
:	Ш(
|
'metrics/auc_precision_recall/LogicalNot
LogicalNot$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(
~
-metrics/auc_precision_recall/Tile_2/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_2Tile&metrics/auc_precision_recall/Reshape_1-metrics/auc_precision_recall/Tile_2/multiples*
_output_shapes
:	Ш(*

Tmultiples0*
T0

}
)metrics/auc_precision_recall/LogicalNot_1
LogicalNot#metrics/auc_precision_recall/Tile_2*
_output_shapes
:	Ш(
}
,metrics/auc_precision_recall/Reshape_2/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:
Ц
&metrics/auc_precision_recall/Reshape_2Reshape.metrics/auc_precision_recall/broadcast_weights,metrics/auc_precision_recall/Reshape_2/shape*
T0*
Tshape0*
_output_shapes

:(
~
-metrics/auc_precision_recall/Tile_3/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_3Tile&metrics/auc_precision_recall/Reshape_2-metrics/auc_precision_recall/Tile_3/multiples*
_output_shapes
:	Ш(*

Tmultiples0*
T0
Ь
=metrics/auc_precision_recall/true_positives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
valueBШ*    
й
+metrics/auc_precision_recall/true_positives
VariableV2*
shared_name *>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
З
2metrics/auc_precision_recall/true_positives/AssignAssign+metrics/auc_precision_recall/true_positives=metrics/auc_precision_recall/true_positives/Initializer/zeros*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(
Я
0metrics/auc_precision_recall/true_positives/readIdentity+metrics/auc_precision_recall/true_positives*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
_output_shapes	
:Ш
Ё
'metrics/auc_precision_recall/LogicalAnd
LogicalAnd#metrics/auc_precision_recall/Tile_2$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(

$metrics/auc_precision_recall/ToFloatCast'metrics/auc_precision_recall/LogicalAnd*

SrcT0
*
Truncate( *
_output_shapes
:	Ш(*

DstT0

 metrics/auc_precision_recall/mulMul$metrics/auc_precision_recall/ToFloat#metrics/auc_precision_recall/Tile_3*
_output_shapes
:	Ш(*
T0
t
2metrics/auc_precision_recall/Sum/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Р
 metrics/auc_precision_recall/SumSum metrics/auc_precision_recall/mul2metrics/auc_precision_recall/Sum/reduction_indices*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0*
T0
ћ
&metrics/auc_precision_recall/AssignAdd	AssignAdd+metrics/auc_precision_recall/true_positives metrics/auc_precision_recall/Sum*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
_output_shapes	
:Ш*
use_locking( 
Ю
>metrics/auc_precision_recall/false_negatives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
valueBШ*    
л
,metrics/auc_precision_recall/false_negatives
VariableV2*
shared_name *?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
Л
3metrics/auc_precision_recall/false_negatives/AssignAssign,metrics/auc_precision_recall/false_negatives>metrics/auc_precision_recall/false_negatives/Initializer/zeros*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(
в
1metrics/auc_precision_recall/false_negatives/readIdentity,metrics/auc_precision_recall/false_negatives*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
_output_shapes	
:Ш
І
)metrics/auc_precision_recall/LogicalAnd_1
LogicalAnd#metrics/auc_precision_recall/Tile_2'metrics/auc_precision_recall/LogicalNot*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_1Cast)metrics/auc_precision_recall/LogicalAnd_1*
Truncate( *
_output_shapes
:	Ш(*

DstT0*

SrcT0

 
"metrics/auc_precision_recall/mul_1Mul&metrics/auc_precision_recall/ToFloat_1#metrics/auc_precision_recall/Tile_3*
T0*
_output_shapes
:	Ш(
v
4metrics/auc_precision_recall/Sum_1/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Ц
"metrics/auc_precision_recall/Sum_1Sum"metrics/auc_precision_recall/mul_14metrics/auc_precision_recall/Sum_1/reduction_indices*
T0*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0

(metrics/auc_precision_recall/AssignAdd_1	AssignAdd,metrics/auc_precision_recall/false_negatives"metrics/auc_precision_recall/Sum_1*
use_locking( *
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
_output_shapes	
:Ш
Ь
=metrics/auc_precision_recall/true_negatives/Initializer/zerosConst*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
valueBШ*    *
dtype0*
_output_shapes	
:Ш
й
+metrics/auc_precision_recall/true_negatives
VariableV2*
shared_name *>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
З
2metrics/auc_precision_recall/true_negatives/AssignAssign+metrics/auc_precision_recall/true_negatives=metrics/auc_precision_recall/true_negatives/Initializer/zeros*
use_locking(*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
validate_shape(*
_output_shapes	
:Ш
Я
0metrics/auc_precision_recall/true_negatives/readIdentity+metrics/auc_precision_recall/true_negatives*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
_output_shapes	
:Ш
Ќ
)metrics/auc_precision_recall/LogicalAnd_2
LogicalAnd)metrics/auc_precision_recall/LogicalNot_1'metrics/auc_precision_recall/LogicalNot*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_2Cast)metrics/auc_precision_recall/LogicalAnd_2*
Truncate( *
_output_shapes
:	Ш(*

DstT0*

SrcT0

 
"metrics/auc_precision_recall/mul_2Mul&metrics/auc_precision_recall/ToFloat_2#metrics/auc_precision_recall/Tile_3*
T0*
_output_shapes
:	Ш(
v
4metrics/auc_precision_recall/Sum_2/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Ц
"metrics/auc_precision_recall/Sum_2Sum"metrics/auc_precision_recall/mul_24metrics/auc_precision_recall/Sum_2/reduction_indices*
T0*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0
џ
(metrics/auc_precision_recall/AssignAdd_2	AssignAdd+metrics/auc_precision_recall/true_negatives"metrics/auc_precision_recall/Sum_2*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
_output_shapes	
:Ш*
use_locking( 
Ю
>metrics/auc_precision_recall/false_positives/Initializer/zerosConst*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
valueBШ*    *
dtype0*
_output_shapes	
:Ш
л
,metrics/auc_precision_recall/false_positives
VariableV2*
shared_name *?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
Л
3metrics/auc_precision_recall/false_positives/AssignAssign,metrics/auc_precision_recall/false_positives>metrics/auc_precision_recall/false_positives/Initializer/zeros*
validate_shape(*
_output_shapes	
:Ш*
use_locking(*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives
в
1metrics/auc_precision_recall/false_positives/readIdentity,metrics/auc_precision_recall/false_positives*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
_output_shapes	
:Ш
Љ
)metrics/auc_precision_recall/LogicalAnd_3
LogicalAnd)metrics/auc_precision_recall/LogicalNot_1$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_3Cast)metrics/auc_precision_recall/LogicalAnd_3*
Truncate( *
_output_shapes
:	Ш(*

DstT0*

SrcT0

 
"metrics/auc_precision_recall/mul_3Mul&metrics/auc_precision_recall/ToFloat_3#metrics/auc_precision_recall/Tile_3*
_output_shapes
:	Ш(*
T0
v
4metrics/auc_precision_recall/Sum_3/reduction_indicesConst*
dtype0*
_output_shapes
: *
value	B :
Ц
"metrics/auc_precision_recall/Sum_3Sum"metrics/auc_precision_recall/mul_34metrics/auc_precision_recall/Sum_3/reduction_indices*
_output_shapes	
:Ш*
	keep_dims( *

Tidx0*
T0

(metrics/auc_precision_recall/AssignAdd_3	AssignAdd,metrics/auc_precision_recall/false_positives"metrics/auc_precision_recall/Sum_3*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
_output_shapes	
:Ш*
use_locking( 
g
"metrics/auc_precision_recall/add/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
Ѓ
 metrics/auc_precision_recall/addAdd0metrics/auc_precision_recall/true_positives/read"metrics/auc_precision_recall/add/y*
T0*
_output_shapes	
:Ш
Д
"metrics/auc_precision_recall/add_1Add0metrics/auc_precision_recall/true_positives/read1metrics/auc_precision_recall/false_negatives/read*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_2/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

"metrics/auc_precision_recall/add_2Add"metrics/auc_precision_recall/add_1$metrics/auc_precision_recall/add_2/y*
T0*
_output_shapes	
:Ш

 metrics/auc_precision_recall/divRealDiv metrics/auc_precision_recall/add"metrics/auc_precision_recall/add_2*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_3/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75
Ї
"metrics/auc_precision_recall/add_3Add0metrics/auc_precision_recall/true_positives/read$metrics/auc_precision_recall/add_3/y*
T0*
_output_shapes	
:Ш
Д
"metrics/auc_precision_recall/add_4Add0metrics/auc_precision_recall/true_positives/read1metrics/auc_precision_recall/false_positives/read*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_5/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75

"metrics/auc_precision_recall/add_5Add"metrics/auc_precision_recall/add_4$metrics/auc_precision_recall/add_5/y*
T0*
_output_shapes	
:Ш

"metrics/auc_precision_recall/div_1RealDiv"metrics/auc_precision_recall/add_3"metrics/auc_precision_recall/add_5*
T0*
_output_shapes	
:Ш
z
0metrics/auc_precision_recall/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
}
2metrics/auc_precision_recall/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:Ч
|
2metrics/auc_precision_recall/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

*metrics/auc_precision_recall/strided_sliceStridedSlice metrics/auc_precision_recall/div0metrics/auc_precision_recall/strided_slice/stack2metrics/auc_precision_recall/strided_slice/stack_12metrics/auc_precision_recall/strided_slice/stack_2*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
|
2metrics/auc_precision_recall/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_1/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_1StridedSlice metrics/auc_precision_recall/div2metrics/auc_precision_recall/strided_slice_1/stack4metrics/auc_precision_recall/strided_slice_1/stack_14metrics/auc_precision_recall/strided_slice_1/stack_2*
end_mask*
_output_shapes	
:Ч*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask 
Ї
 metrics/auc_precision_recall/subSub*metrics/auc_precision_recall/strided_slice,metrics/auc_precision_recall/strided_slice_1*
T0*
_output_shapes	
:Ч
|
2metrics/auc_precision_recall/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 

4metrics/auc_precision_recall/strided_slice_2/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_2StridedSlice"metrics/auc_precision_recall/div_12metrics/auc_precision_recall/strided_slice_2/stack4metrics/auc_precision_recall/strided_slice_2/stack_14metrics/auc_precision_recall/strided_slice_2/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0*
shrink_axis_mask 
|
2metrics/auc_precision_recall/strided_slice_3/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_3/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
~
4metrics/auc_precision_recall/strided_slice_3/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_3StridedSlice"metrics/auc_precision_recall/div_12metrics/auc_precision_recall/strided_slice_3/stack4metrics/auc_precision_recall/strided_slice_3/stack_14metrics/auc_precision_recall/strided_slice_3/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
Index0*
T0
Ћ
"metrics/auc_precision_recall/add_6Add,metrics/auc_precision_recall/strided_slice_2,metrics/auc_precision_recall/strided_slice_3*
T0*
_output_shapes	
:Ч
k
&metrics/auc_precision_recall/truediv/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
Ё
$metrics/auc_precision_recall/truedivRealDiv"metrics/auc_precision_recall/add_6&metrics/auc_precision_recall/truediv/y*
T0*
_output_shapes	
:Ч

"metrics/auc_precision_recall/Mul_4Mul metrics/auc_precision_recall/sub$metrics/auc_precision_recall/truediv*
T0*
_output_shapes	
:Ч
n
$metrics/auc_precision_recall/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
Б
"metrics/auc_precision_recall/valueSum"metrics/auc_precision_recall/Mul_4$metrics/auc_precision_recall/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
$metrics/auc_precision_recall/add_7/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75

"metrics/auc_precision_recall/add_7Add&metrics/auc_precision_recall/AssignAdd$metrics/auc_precision_recall/add_7/y*
T0*
_output_shapes	
:Ш
Ё
"metrics/auc_precision_recall/add_8Add&metrics/auc_precision_recall/AssignAdd(metrics/auc_precision_recall/AssignAdd_1*
_output_shapes	
:Ш*
T0
i
$metrics/auc_precision_recall/add_9/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75

"metrics/auc_precision_recall/add_9Add"metrics/auc_precision_recall/add_8$metrics/auc_precision_recall/add_9/y*
T0*
_output_shapes	
:Ш

"metrics/auc_precision_recall/div_2RealDiv"metrics/auc_precision_recall/add_7"metrics/auc_precision_recall/add_9*
T0*
_output_shapes	
:Ш
j
%metrics/auc_precision_recall/add_10/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

#metrics/auc_precision_recall/add_10Add&metrics/auc_precision_recall/AssignAdd%metrics/auc_precision_recall/add_10/y*
T0*
_output_shapes	
:Ш
Ђ
#metrics/auc_precision_recall/add_11Add&metrics/auc_precision_recall/AssignAdd(metrics/auc_precision_recall/AssignAdd_3*
T0*
_output_shapes	
:Ш
j
%metrics/auc_precision_recall/add_12/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

#metrics/auc_precision_recall/add_12Add#metrics/auc_precision_recall/add_11%metrics/auc_precision_recall/add_12/y*
_output_shapes	
:Ш*
T0

"metrics/auc_precision_recall/div_3RealDiv#metrics/auc_precision_recall/add_10#metrics/auc_precision_recall/add_12*
T0*
_output_shapes	
:Ш
|
2metrics/auc_precision_recall/strided_slice_4/stackConst*
valueB: *
dtype0*
_output_shapes
:

4metrics/auc_precision_recall/strided_slice_4/stack_1Const*
dtype0*
_output_shapes
:*
valueB:Ч
~
4metrics/auc_precision_recall/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_4StridedSlice"metrics/auc_precision_recall/div_22metrics/auc_precision_recall/strided_slice_4/stack4metrics/auc_precision_recall/strided_slice_4/stack_14metrics/auc_precision_recall/strided_slice_4/stack_2*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes	
:Ч
|
2metrics/auc_precision_recall/strided_slice_5/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_5/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_5/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_5StridedSlice"metrics/auc_precision_recall/div_22metrics/auc_precision_recall/strided_slice_5/stack4metrics/auc_precision_recall/strided_slice_5/stack_14metrics/auc_precision_recall/strided_slice_5/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч
Ћ
"metrics/auc_precision_recall/sub_1Sub,metrics/auc_precision_recall/strided_slice_4,metrics/auc_precision_recall/strided_slice_5*
T0*
_output_shapes	
:Ч
|
2metrics/auc_precision_recall/strided_slice_6/stackConst*
valueB: *
dtype0*
_output_shapes
:

4metrics/auc_precision_recall/strided_slice_6/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_6/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_6StridedSlice"metrics/auc_precision_recall/div_32metrics/auc_precision_recall/strided_slice_6/stack4metrics/auc_precision_recall/strided_slice_6/stack_14metrics/auc_precision_recall/strided_slice_6/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч
|
2metrics/auc_precision_recall/strided_slice_7/stackConst*
dtype0*
_output_shapes
:*
valueB:
~
4metrics/auc_precision_recall/strided_slice_7/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_7/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_7StridedSlice"metrics/auc_precision_recall/div_32metrics/auc_precision_recall/strided_slice_7/stack4metrics/auc_precision_recall/strided_slice_7/stack_14metrics/auc_precision_recall/strided_slice_7/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
Ќ
#metrics/auc_precision_recall/add_13Add,metrics/auc_precision_recall/strided_slice_6,metrics/auc_precision_recall/strided_slice_7*
T0*
_output_shapes	
:Ч
m
(metrics/auc_precision_recall/truediv_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
І
&metrics/auc_precision_recall/truediv_1RealDiv#metrics/auc_precision_recall/add_13(metrics/auc_precision_recall/truediv_1/y*
T0*
_output_shapes	
:Ч

"metrics/auc_precision_recall/Mul_5Mul"metrics/auc_precision_recall/sub_1&metrics/auc_precision_recall/truediv_1*
T0*
_output_shapes	
:Ч
n
$metrics/auc_precision_recall/Const_2Const*
valueB: *
dtype0*
_output_shapes
:
Е
&metrics/auc_precision_recall/update_opSum"metrics/auc_precision_recall/Mul_5$metrics/auc_precision_recall/Const_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

mean/total/Initializer/zerosConst*
_class
loc:@mean/total*
valueB
 *    *
dtype0*
_output_shapes
: 


mean/total
VariableV2*
_class
loc:@mean/total*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
Ў
mean/total/AssignAssign
mean/totalmean/total/Initializer/zeros*
T0*
_class
loc:@mean/total*
validate_shape(*
_output_shapes
: *
use_locking(
g
mean/total/readIdentity
mean/total*
T0*
_class
loc:@mean/total*
_output_shapes
: 

mean/count/Initializer/zerosConst*
_class
loc:@mean/count*
valueB
 *    *
dtype0*
_output_shapes
: 


mean/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean/count*
	container *
shape: 
Ў
mean/count/AssignAssign
mean/countmean/count/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@mean/count
g
mean/count/readIdentity
mean/count*
_output_shapes
: *
T0*
_class
loc:@mean/count
K
	mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
_
mean/ToFloatCast	mean/Size*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
M

mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
q
mean/SumSumhead/weighted_loss/Sum
mean/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

mean/AssignAdd	AssignAdd
mean/totalmean/Sum*
_output_shapes
: *
use_locking( *
T0*
_class
loc:@mean/total
Ѓ
mean/AssignAdd_1	AssignAdd
mean/countmean/ToFloat^head/weighted_loss/Sum*
T0*
_class
loc:@mean/count*
_output_shapes
: *
use_locking( 
Z
mean/truedivRealDivmean/total/readmean/count/read*
T0*
_output_shapes
: 
T
mean/zeros_likeConst*
dtype0*
_output_shapes
: *
valueB
 *    
Z
mean/GreaterGreatermean/count/readmean/zeros_like*
T0*
_output_shapes
: 
b

mean/valueSelectmean/Greatermean/truedivmean/zeros_like*
T0*
_output_shapes
: 
\
mean/truediv_1RealDivmean/AssignAddmean/AssignAdd_1*
T0*
_output_shapes
: 
V
mean/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 
_
mean/Greater_1Greatermean/AssignAdd_1mean/zeros_like_1*
_output_shapes
: *
T0
l
mean/update_opSelectmean/Greater_1mean/truediv_1mean/zeros_like_1*
T0*
_output_shapes
: 
Ф

group_depsNoOp^mean/update_op^metrics/accuracy/update_op$^metrics/accuracy_baseline/update_op^metrics/auc/update_op'^metrics/auc_precision_recall/update_op^metrics/average_loss/update_op^metrics/label/mean/update_op^metrics/precision/update_op"^metrics/prediction/mean/update_op^metrics/recall/update_op
{
eval_step/Initializer/zerosConst*
_class
loc:@eval_step*
value	B	 R *
dtype0	*
_output_shapes
: 

	eval_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@eval_step*
	container *
shape: 
Њ
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
T0	*
_class
loc:@eval_step*
validate_shape(*
_output_shapes
: *
use_locking(
d
eval_step/readIdentity	eval_step*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
Q
AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 

	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
use_locking(*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
U
readIdentity	eval_step
^AssignAdd^group_deps*
_output_shapes
: *
T0	
;
IdentityIdentityread*
T0	*
_output_shapes
: 

initNoOp%^dnn/hiddenlayer_0/bias/part_0/Assign'^dnn/hiddenlayer_0/kernel/part_0/Assign%^dnn/hiddenlayer_1/bias/part_0/Assign'^dnn/hiddenlayer_1/kernel/part_0/Assign%^dnn/hiddenlayer_2/bias/part_0/Assign'^dnn/hiddenlayer_2/kernel/part_0/Assign%^dnn/hiddenlayer_3/bias/part_0/Assign'^dnn/hiddenlayer_3/kernel/part_0/Assign^dnn/logits/bias/part_0/Assign ^dnn/logits/kernel/part_0/Assign^global_step/Assign/^linear/linear_model/bias_weights/part_0/Assign5^linear/linear_model/company_xf/weights/part_0/Assign>^linear/linear_model/dropoff_latitude_xf/weights/part_0/Assign?^linear/linear_model/dropoff_longitude_xf/weights/part_0/Assign:^linear/linear_model/payment_type_xf/weights/part_0/Assign=^linear/linear_model/pickup_latitude_xf/weights/part_0/Assign>^linear/linear_model/pickup_longitude_xf/weights/part_0/Assign<^linear/linear_model/trip_start_day_xf/weights/part_0/Assign=^linear/linear_model/trip_start_hour_xf/weights/part_0/Assign>^linear/linear_model/trip_start_month_xf/weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
{
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
y
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedmetrics/label/mean/total*+
_class!
loc:@metrics/label/mean/total*
dtype0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializedmetrics/label/mean/count*+
_class!
loc:@metrics/label/mean/count*
dtype0*
_output_shapes
: 
П
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedmetrics/average_loss/total*-
_class#
!loc:@metrics/average_loss/total*
dtype0*
_output_shapes
: 
П
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializedmetrics/average_loss/count*-
_class#
!loc:@metrics/average_loss/count*
dtype0*
_output_shapes
: 
З
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedmetrics/accuracy/total*)
_class
loc:@metrics/accuracy/total*
dtype0*
_output_shapes
: 
З
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializedmetrics/accuracy/count*)
_class
loc:@metrics/accuracy/count*
dtype0*
_output_shapes
: 
з
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized&metrics/precision/true_positives/count*9
_class/
-+loc:@metrics/precision/true_positives/count*
dtype0*
_output_shapes
: 
й
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitialized'metrics/precision/false_positives/count*:
_class0
.,loc:@metrics/precision/false_positives/count*
dtype0*
_output_shapes
: 
б
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized#metrics/recall/true_positives/count*
dtype0*
_output_shapes
: *6
_class,
*(loc:@metrics/recall/true_positives/count
д
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized$metrics/recall/false_negatives/count*
dtype0*
_output_shapes
: *7
_class-
+)loc:@metrics/recall/false_negatives/count
Ц
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitializedmetrics/prediction/mean/total*0
_class&
$"loc:@metrics/prediction/mean/total*
dtype0*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitializedmetrics/prediction/mean/count*0
_class&
$"loc:@metrics/prediction/mean/count*
dtype0*
_output_shapes
: 
Р
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitializedmetrics/auc/true_positives*-
_class#
!loc:@metrics/auc/true_positives*
dtype0*
_output_shapes
: 
Т
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitializedmetrics/auc/false_negatives*.
_class$
" loc:@metrics/auc/false_negatives*
dtype0*
_output_shapes
: 
Р
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedmetrics/auc/true_negatives*-
_class#
!loc:@metrics/auc/true_negatives*
dtype0*
_output_shapes
: 
Т
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitializedmetrics/auc/false_positives*.
_class$
" loc:@metrics/auc/false_positives*
dtype0*
_output_shapes
: 
т
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized+metrics/auc_precision_recall/true_positives*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
dtype0*
_output_shapes
: 
ф
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized,metrics/auc_precision_recall/false_negatives*
dtype0*
_output_shapes
: *?
_class5
31loc:@metrics/auc_precision_recall/false_negatives
т
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized+metrics/auc_precision_recall/true_negatives*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
dtype0*
_output_shapes
: 
ф
7report_uninitialized_variables/IsVariableInitialized_20IsVariableInitialized,metrics/auc_precision_recall/false_positives*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
dtype0*
_output_shapes
: 
 
7report_uninitialized_variables/IsVariableInitialized_21IsVariableInitialized
mean/total*
_class
loc:@mean/total*
dtype0*
_output_shapes
: 
 
7report_uninitialized_variables/IsVariableInitialized_22IsVariableInitialized
mean/count*
_class
loc:@mean/count*
dtype0*
_output_shapes
: 

7report_uninitialized_variables/IsVariableInitialized_23IsVariableInitialized	eval_step*
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 
э
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized1report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_196report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_197report_uninitialized_variables/IsVariableInitialized_207report_uninitialized_variables/IsVariableInitialized_217report_uninitialized_variables/IsVariableInitialized_227report_uninitialized_variables/IsVariableInitialized_23"/device:CPU:0*
T0
*

axis *
N,*
_output_shapes
:,

)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:,

$report_uninitialized_variables/ConstConst"/device:CPU:0*
dtype0*
_output_shapes
:,*І
valueB,Bglobal_stepBdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0Bdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0Bdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0Bdnn/hiddenlayer_3/kernel/part_0Bdnn/hiddenlayer_3/bias/part_0Bdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B-linear/linear_model/company_xf/weights/part_0B6linear/linear_model/dropoff_latitude_xf/weights/part_0B7linear/linear_model/dropoff_longitude_xf/weights/part_0B2linear/linear_model/payment_type_xf/weights/part_0B5linear/linear_model/pickup_latitude_xf/weights/part_0B6linear/linear_model/pickup_longitude_xf/weights/part_0B4linear/linear_model/trip_start_day_xf/weights/part_0B5linear/linear_model/trip_start_hour_xf/weights/part_0B6linear/linear_model/trip_start_month_xf/weights/part_0B'linear/linear_model/bias_weights/part_0Bmetrics/label/mean/totalBmetrics/label/mean/countBmetrics/average_loss/totalBmetrics/average_loss/countBmetrics/accuracy/totalBmetrics/accuracy/countB&metrics/precision/true_positives/countB'metrics/precision/false_positives/countB#metrics/recall/true_positives/countB$metrics/recall/false_negatives/countBmetrics/prediction/mean/totalBmetrics/prediction/mean/countBmetrics/auc/true_positivesBmetrics/auc/false_negativesBmetrics/auc/true_negativesBmetrics/auc/false_positivesB+metrics/auc_precision_recall/true_positivesB,metrics/auc_precision_recall/false_negativesB+metrics/auc_precision_recall/true_negativesB,metrics/auc_precision_recall/false_positivesB
mean/totalB
mean/countB	eval_step

1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ш
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
:

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
№
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes
: 

3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
№
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
О
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
N*
_output_shapes
:*
T0*

axis 

7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
ї
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*
T0*
N*
_output_shapes
:*

Tidx0
к
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:,

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
ъ
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
_output_shapes
:,*
T0
*
Tshape0
В
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:џџџџџџџџџ
Х
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*#
_output_shapes
:џџџџџџџџџ*
squeeze_dims
*
T0	

9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
Х
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
M
concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
О
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*
N*#
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ё
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
}
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
{
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 


&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized3report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_19"/device:CPU:0*
N*
_output_shapes
:*
T0
*

axis 

+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:
Я
&report_uninitialized_variables_1/ConstConst"/device:CPU:0*х
valueлBиBglobal_stepBdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0Bdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0Bdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0Bdnn/hiddenlayer_3/kernel/part_0Bdnn/hiddenlayer_3/bias/part_0Bdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B-linear/linear_model/company_xf/weights/part_0B6linear/linear_model/dropoff_latitude_xf/weights/part_0B7linear/linear_model/dropoff_longitude_xf/weights/part_0B2linear/linear_model/payment_type_xf/weights/part_0B5linear/linear_model/pickup_latitude_xf/weights/part_0B6linear/linear_model/pickup_longitude_xf/weights/part_0B4linear/linear_model/trip_start_day_xf/weights/part_0B5linear/linear_model/trip_start_hour_xf/weights/part_0B6linear/linear_model/trip_start_month_xf/weights/part_0B'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:

3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ђ
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
њ
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
њ
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask 
Т
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*
N*
_output_shapes
:*

Tidx0*
T0
р
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
№
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
_output_shapes
:*
T0
*
Tshape0
Ж
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:џџџџџџџџџ
Щ
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:џџџџџџџџџ

;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
Э
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:џџџџџџџџџ

init_2NoOp^eval_step/Assign^mean/count/Assign^mean/total/Assign^metrics/accuracy/count/Assign^metrics/accuracy/total/Assign#^metrics/auc/false_negatives/Assign#^metrics/auc/false_positives/Assign"^metrics/auc/true_negatives/Assign"^metrics/auc/true_positives/Assign4^metrics/auc_precision_recall/false_negatives/Assign4^metrics/auc_precision_recall/false_positives/Assign3^metrics/auc_precision_recall/true_negatives/Assign3^metrics/auc_precision_recall/true_positives/Assign"^metrics/average_loss/count/Assign"^metrics/average_loss/total/Assign ^metrics/label/mean/count/Assign ^metrics/label/mean/total/Assign/^metrics/precision/false_positives/count/Assign.^metrics/precision/true_positives/count/Assign%^metrics/prediction/mean/count/Assign%^metrics/prediction/mean/total/Assign,^metrics/recall/false_negatives/count/Assign+^metrics/recall/true_positives/count/Assign

init_all_tablesNoOp

init_3NoOp
8
group_deps_2NoOp^init_2^init_3^init_all_tables

Merge/MergeSummaryMergeSummary7read_batch_features/file_name_queue/fraction_of_32_full2read_batch_features/fraction_over_9880_of_120_full]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation-dnn/dnn/hiddenlayer_3/fraction_of_zero_values dnn/dnn/hiddenlayer_3/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activationlinear/biaslinear/fraction_of_zero_weights%linear/linear/fraction_of_zero_valueslinear/linear/activation*
N*
_output_shapes
: 
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
r
save/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d
X
save/IdentityIdentitysave/Read/ReadVariableOp*
_output_shapes
:d*
T0
^
save/Identity_1Identitysave/Identity"/device:CPU:0*
_output_shapes
:d*
T0
z
save/Read_1/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d
`
save/Identity_2Identitysave/Read_1/ReadVariableOp*
T0*
_output_shapes

:d
d
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
T0*
_output_shapes

:d
t
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F
\
save/Identity_4Identitysave/Read_2/ReadVariableOp*
T0*
_output_shapes
:F
`
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
T0*
_output_shapes
:F
z
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF
`
save/Identity_6Identitysave/Read_3/ReadVariableOp*
T0*
_output_shapes

:dF
d
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
_output_shapes

:dF*
T0
t
save/Read_4/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0
\
save/Identity_8Identitysave/Read_4/ReadVariableOp*
_output_shapes
:0*
T0
`
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
T0*
_output_shapes
:0
z
save/Read_5/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
a
save/Identity_10Identitysave/Read_5/ReadVariableOp*
T0*
_output_shapes

:F0
f
save/Identity_11Identitysave/Identity_10"/device:CPU:0*
T0*
_output_shapes

:F0
t
save/Read_6/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"
]
save/Identity_12Identitysave/Read_6/ReadVariableOp*
T0*
_output_shapes
:"
b
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
T0*
_output_shapes
:"
z
save/Read_7/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
a
save/Identity_14Identitysave/Read_7/ReadVariableOp*
T0*
_output_shapes

:0"
f
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
_output_shapes

:0"*
T0
m
save/Read_8/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
]
save/Identity_16Identitysave/Read_8/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
_output_shapes
:*
T0
s
save/Read_9/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
a
save/Identity_18Identitysave/Read_9/ReadVariableOp*
T0*
_output_shapes

:"
f
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
T0*
_output_shapes

:"

save/Read_10/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:
^
save/Identity_20Identitysave/Read_10/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
T0*
_output_shapes
:

save/Read_11/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
c
save/Identity_22Identitysave/Read_11/ReadVariableOp*
_output_shapes
:	ђ*
T0
g
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
_output_shapes
:	ђ*
T0

save/Read_12/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_24Identitysave/Read_12/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
T0*
_output_shapes

:


save/Read_13/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_26Identitysave/Read_13/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
T0*
_output_shapes

:


save/Read_14/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
c
save/Identity_28Identitysave/Read_14/ReadVariableOp*
T0*
_output_shapes
:	ђ
g
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/Read_15/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_30Identitysave/Read_15/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
T0*
_output_shapes

:


save/Read_16/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_32Identitysave/Read_16/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
T0*
_output_shapes

:


save/Read_17/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_34Identitysave/Read_17/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_35Identitysave/Identity_34"/device:CPU:0*
_output_shapes

:*
T0

save/Read_18/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_36Identitysave/Read_18/ReadVariableOp*
_output_shapes

:*
T0
f
save/Identity_37Identitysave/Identity_36"/device:CPU:0*
T0*
_output_shapes

:

save/Read_19/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_38Identitysave/Read_19/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_39Identitysave/Identity_38"/device:CPU:0*
T0*
_output_shapes

:

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_00039c177e9f42258a414a5074cef31d/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
{
save/SaveV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
t
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 

save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/Read_20/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:d
m
save/Identity_40Identitysave/Read_20/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:d
b
save/Identity_41Identitysave/Identity_40"/device:CPU:0*
T0*
_output_shapes
:d

save/Read_21/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:d
q
save/Identity_42Identitysave/Read_21/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:d
f
save/Identity_43Identitysave/Identity_42"/device:CPU:0*
T0*
_output_shapes

:d

save/Read_22/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:F
m
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
_output_shapes
:F*
T0
b
save/Identity_45Identitysave/Identity_44"/device:CPU:0*
_output_shapes
:F*
T0

save/Read_23/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:dF
q
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
_output_shapes

:dF*
T0
f
save/Identity_47Identitysave/Identity_46"/device:CPU:0*
T0*
_output_shapes

:dF

save/Read_24/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:0
m
save/Identity_48Identitysave/Read_24/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:0
b
save/Identity_49Identitysave/Identity_48"/device:CPU:0*
_output_shapes
:0*
T0

save/Read_25/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:F0
q
save/Identity_50Identitysave/Read_25/ReadVariableOp"/device:CPU:0*
_output_shapes

:F0*
T0
f
save/Identity_51Identitysave/Identity_50"/device:CPU:0*
T0*
_output_shapes

:F0

save/Read_26/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:"
m
save/Identity_52Identitysave/Read_26/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:"
b
save/Identity_53Identitysave/Identity_52"/device:CPU:0*
T0*
_output_shapes
:"

save/Read_27/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:0"
q
save/Identity_54Identitysave/Read_27/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:0"
f
save/Identity_55Identitysave/Identity_54"/device:CPU:0*
T0*
_output_shapes

:0"
}
save/Read_28/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_56Identitysave/Read_28/ReadVariableOp"/device:CPU:0*
_output_shapes
:*
T0
b
save/Identity_57Identitysave/Identity_56"/device:CPU:0*
T0*
_output_shapes
:

save/Read_29/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:"
q
save/Identity_58Identitysave/Read_29/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:"
f
save/Identity_59Identitysave/Identity_58"/device:CPU:0*
T0*
_output_shapes

:"

save/Read_30/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_60Identitysave/Read_30/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_61Identitysave/Identity_60"/device:CPU:0*
T0*
_output_shapes
:

save/Read_31/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	ђ
r
save/Identity_62Identitysave/Read_31/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	ђ
g
save/Identity_63Identitysave/Identity_62"/device:CPU:0*
_output_shapes
:	ђ*
T0
Ё
save/Read_32/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_64Identitysave/Read_32/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_65Identitysave/Identity_64"/device:CPU:0*
T0*
_output_shapes

:

Ђ
save/Read_33/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_66Identitysave/Read_33/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_67Identitysave/Identity_66"/device:CPU:0*
T0*
_output_shapes

:


save/Read_34/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	ђ
r
save/Identity_68Identitysave/Read_34/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	ђ
g
save/Identity_69Identitysave/Identity_68"/device:CPU:0*
T0*
_output_shapes
:	ђ
 
save/Read_35/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_70Identitysave/Read_35/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_71Identitysave/Identity_70"/device:CPU:0*
T0*
_output_shapes

:

Ё
save/Read_36/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_72Identitysave/Read_36/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_73Identitysave/Identity_72"/device:CPU:0*
T0*
_output_shapes

:


save/Read_37/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_74Identitysave/Read_37/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_75Identitysave/Identity_74"/device:CPU:0*
T0*
_output_shapes

:
 
save/Read_38/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_76Identitysave/Read_38/ReadVariableOp"/device:CPU:0*
_output_shapes

:*
T0
f
save/Identity_77Identitysave/Identity_76"/device:CPU:0*
T0*
_output_shapes

:
Ё
save/Read_39/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_78Identitysave/Read_39/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_79Identitysave/Identity_78"/device:CPU:0*
T0*
_output_shapes

:
Њ
save/SaveV2_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*Ь
valueТBПBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBdnn/logits/biasBdnn/logits/kernelB linear/linear_model/bias_weightsB&linear/linear_model/company_xf/weightsB/linear/linear_model/dropoff_latitude_xf/weightsB0linear/linear_model/dropoff_longitude_xf/weightsB+linear/linear_model/payment_type_xf/weightsB.linear/linear_model/pickup_latitude_xf/weightsB/linear/linear_model/pickup_longitude_xf/weightsB-linear/linear_model/trip_start_day_xf/weightsB.linear/linear_model/trip_start_hour_xf/weightsB/linear/linear_model/trip_start_month_xf/weights

save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*­
valueЃB B	100 0,100B3 100 0,3:0,100B70 0,70B100 70 0,100:0,70B48 0,48B70 48 0,70:0,48B34 0,34B48 34 0,48:0,34B1 0,1B34 1 0,34:0,1B1 0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B31 1 0,31:0,1B24 1 0,24:0,1B12 1 0,12:0,1*
dtype0*
_output_shapes
:

save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_41save/Identity_43save/Identity_45save/Identity_47save/Identity_49save/Identity_51save/Identity_53save/Identity_55save/Identity_57save/Identity_59save/Identity_61save/Identity_63save/Identity_65save/Identity_67save/Identity_69save/Identity_71save/Identity_73save/Identity_75save/Identity_77save/Identity_79"/device:CPU:0*"
dtypes
2
Ј
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
р
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
Ј
save/Identity_80Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
_output_shapes
: 
~
save/RestoreV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
w
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2	

save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
(
save/restore_shardNoOp^save/Assign
­
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*Ь
valueТBПBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBdnn/logits/biasBdnn/logits/kernelB linear/linear_model/bias_weightsB&linear/linear_model/company_xf/weightsB/linear/linear_model/dropoff_latitude_xf/weightsB0linear/linear_model/dropoff_longitude_xf/weightsB+linear/linear_model/payment_type_xf/weightsB.linear/linear_model/pickup_latitude_xf/weightsB/linear/linear_model/pickup_longitude_xf/weightsB-linear/linear_model/trip_start_day_xf/weightsB.linear/linear_model/trip_start_hour_xf/weightsB/linear/linear_model/trip_start_month_xf/weights

!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*­
valueЃB B	100 0,100B3 100 0,3:0,100B70 0,70B100 70 0,100:0,70B48 0,48B70 48 0,70:0,48B34 0,34B48 34 0,48:0,34B1 0,1B34 1 0,34:0,1B1 0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B31 1 0,31:0,1B24 1 0,24:0,1B12 1 0,12:0,1*
dtype0*
_output_shapes
:
щ
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*Ш
_output_shapesЕ
В:d:d:F:dF:0:F0:":0"::"::	ђ:
:
:	ђ:
:
:::*"
dtypes
2
b
save/Identity_81Identitysave/RestoreV2_1"/device:CPU:0*
T0*
_output_shapes
:d
v
save/AssignVariableOpAssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_81"/device:CPU:0*
dtype0
h
save/Identity_82Identitysave/RestoreV2_1:1"/device:CPU:0*
T0*
_output_shapes

:d
z
save/AssignVariableOp_1AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_82"/device:CPU:0*
dtype0
d
save/Identity_83Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes
:F
x
save/AssignVariableOp_2AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_83"/device:CPU:0*
dtype0
h
save/Identity_84Identitysave/RestoreV2_1:3"/device:CPU:0*
T0*
_output_shapes

:dF
z
save/AssignVariableOp_3AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_84"/device:CPU:0*
dtype0
d
save/Identity_85Identitysave/RestoreV2_1:4"/device:CPU:0*
_output_shapes
:0*
T0
x
save/AssignVariableOp_4AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_85"/device:CPU:0*
dtype0
h
save/Identity_86Identitysave/RestoreV2_1:5"/device:CPU:0*
T0*
_output_shapes

:F0
z
save/AssignVariableOp_5AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_86"/device:CPU:0*
dtype0
d
save/Identity_87Identitysave/RestoreV2_1:6"/device:CPU:0*
T0*
_output_shapes
:"
x
save/AssignVariableOp_6AssignVariableOpdnn/hiddenlayer_3/bias/part_0save/Identity_87"/device:CPU:0*
dtype0
h
save/Identity_88Identitysave/RestoreV2_1:7"/device:CPU:0*
T0*
_output_shapes

:0"
z
save/AssignVariableOp_7AssignVariableOpdnn/hiddenlayer_3/kernel/part_0save/Identity_88"/device:CPU:0*
dtype0
d
save/Identity_89Identitysave/RestoreV2_1:8"/device:CPU:0*
T0*
_output_shapes
:
q
save/AssignVariableOp_8AssignVariableOpdnn/logits/bias/part_0save/Identity_89"/device:CPU:0*
dtype0
h
save/Identity_90Identitysave/RestoreV2_1:9"/device:CPU:0*
T0*
_output_shapes

:"
s
save/AssignVariableOp_9AssignVariableOpdnn/logits/kernel/part_0save/Identity_90"/device:CPU:0*
dtype0
e
save/Identity_91Identitysave/RestoreV2_1:10"/device:CPU:0*
T0*
_output_shapes
:

save/AssignVariableOp_10AssignVariableOp'linear/linear_model/bias_weights/part_0save/Identity_91"/device:CPU:0*
dtype0
j
save/Identity_92Identitysave/RestoreV2_1:11"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/AssignVariableOp_11AssignVariableOp-linear/linear_model/company_xf/weights/part_0save/Identity_92"/device:CPU:0*
dtype0
i
save/Identity_93Identitysave/RestoreV2_1:12"/device:CPU:0*
T0*
_output_shapes

:


save/AssignVariableOp_12AssignVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0save/Identity_93"/device:CPU:0*
dtype0
i
save/Identity_94Identitysave/RestoreV2_1:13"/device:CPU:0*
_output_shapes

:
*
T0

save/AssignVariableOp_13AssignVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0save/Identity_94"/device:CPU:0*
dtype0
j
save/Identity_95Identitysave/RestoreV2_1:14"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/AssignVariableOp_14AssignVariableOp2linear/linear_model/payment_type_xf/weights/part_0save/Identity_95"/device:CPU:0*
dtype0
i
save/Identity_96Identitysave/RestoreV2_1:15"/device:CPU:0*
_output_shapes

:
*
T0

save/AssignVariableOp_15AssignVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0save/Identity_96"/device:CPU:0*
dtype0
i
save/Identity_97Identitysave/RestoreV2_1:16"/device:CPU:0*
T0*
_output_shapes

:


save/AssignVariableOp_16AssignVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0save/Identity_97"/device:CPU:0*
dtype0
i
save/Identity_98Identitysave/RestoreV2_1:17"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_17AssignVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0save/Identity_98"/device:CPU:0*
dtype0
i
save/Identity_99Identitysave/RestoreV2_1:18"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_18AssignVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0save/Identity_99"/device:CPU:0*
dtype0
j
save/Identity_100Identitysave/RestoreV2_1:19"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_19AssignVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0save/Identity_100"/device:CPU:0*
dtype0
Л
save/restore_shard_1NoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1"jІE_І     %rл	ЇъњџзAJвЬ
ТA A
:
Add
x"T
y"T
z"T"
Ttype:
2	
W
AddN
inputs"T*N
sum"T"
Nint(0"!
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
И
AsString

input"T

output"
Ttype:
2		
"
	precisionintџџџџџџџџџ"

scientificbool( "
shortestbool( "
widthintџџџџџџџџџ"
fillstring 
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
s
	AssignAdd
ref"T

value"T

output_ref"T" 
Ttype:
2	"
use_lockingbool( 
B
AssignVariableOp
resource
value"dtype"
dtypetype
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
B
Equal
x"T
y"T
z
"
Ttype:
2	

,
Exp
x"T
y"T"
Ttype:

2
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
Ў
FIFOQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityintџџџџџџџџџ"
	containerstring "
shared_namestring 
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
p
GatherNd
params"Tparams
indices"Tindices
output"Tparams"
Tparamstype"
Tindicestype:
2	

GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
=
Greater
x"T
y"T
z
"
Ttype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype
is_initialized
"
dtypetype
:
Less
x"T
y"T
z
"
Ttype:
2	
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
.
Log1p
x"T
y"T"
Ttype:

2
$

LogicalAnd
x

y

z



LogicalNot
x

y

#
	LogicalOr
x

y

z

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
;
Maximum
x"T
y"T
z"T"
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
8
MergeSummary
inputs*N
summary"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	

M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
я
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
B
QueueCloseV2

handle"#
cancel_pending_enqueuesbool( 

QueueDequeueManyV2

handle
n

components2component_types"!
component_types
list(type)(0"

timeout_msintџџџџџџџџџ

QueueDequeueV2

handle

components2component_types"!
component_types
list(type)(0"

timeout_msintџџџџџџџџџ
}
QueueEnqueueManyV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msintџџџџџџџџџ
y
QueueEnqueueV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msintџџџџџџџџџ
&
QueueSizeV2

handle
size
Y
RandomShuffle

value"T
output"T"
seedint "
seed2int "	
Ttype
ј
RandomShuffleQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityintџџџџџџџџџ"
min_after_dequeueint "
seedint "
seed2int "
	containerstring "
shared_namestring 
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
)
Rank

input"T

output"	
Ttype
@
ReadVariableOp
resource
value"dtype"
dtypetype
a
ReaderReadUpToV2
reader_handle
queue_handle
num_records	
keys

values
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2
З
SparseFillEmptyRows
indices	
values"T
dense_shape	
default_value"T
output_indices	
output_values"T
empty_row_indicator

reverse_index_map	"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	

SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2	"
Tidxtype0:
2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
і
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
|
TFRecordReaderV2
reader_handle"
	containerstring "
shared_namestring "
compression_typestring 
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape
9
VarIsInitializedOp
resource
is_initialized

s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
E
Where

input"T	
index	"%
Ttype0
:
2	

&
	ZerosLike
x"T
y"T"	
Ttype*1.12.02v1.12.0-0-ga6d8ffae09

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step
VariableV2*
shared_name *
_class
loc:@global_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
В
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 

)read_batch_features/file_name_queue/inputConst"/device:CPU:0*В
valueЈBЅB/usr/local/google/home/jyzhao/airflow/data/tfx/pipelines/chicago_taxi_oneshot/Transform/transformed_examples/5/eval/transformed_examples-00000-of-00001.gz*
dtype0*
_output_shapes
:
y
(read_batch_features/file_name_queue/SizeConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
~
-read_batch_features/file_name_queue/Greater/yConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
П
+read_batch_features/file_name_queue/GreaterGreater(read_batch_features/file_name_queue/Size-read_batch_features/file_name_queue/Greater/y"/device:CPU:0*
T0*
_output_shapes
: 
Ж
0read_batch_features/file_name_queue/Assert/ConstConst"/device:CPU:0*G
value>B< B6string_input_producer requires a non-null input tensor*
dtype0*
_output_shapes
: 
О
8read_batch_features/file_name_queue/Assert/Assert/data_0Const"/device:CPU:0*G
value>B< B6string_input_producer requires a non-null input tensor*
dtype0*
_output_shapes
: 
Ю
1read_batch_features/file_name_queue/Assert/AssertAssert+read_batch_features/file_name_queue/Greater8read_batch_features/file_name_queue/Assert/Assert/data_0"/device:CPU:0*

T
2*
	summarize
Ы
,read_batch_features/file_name_queue/IdentityIdentity)read_batch_features/file_name_queue/input2^read_batch_features/file_name_queue/Assert/Assert"/device:CPU:0*
T0*
_output_shapes
:
Н
1read_batch_features/file_name_queue/RandomShuffleRandomShuffle,read_batch_features/file_name_queue/Identity"/device:CPU:0*

seed *
T0*
seed2 *
_output_shapes
:
З
#read_batch_features/file_name_queueFIFOQueueV2"/device:CPU:0*
_output_shapes
: *
component_types
2*
shapes
: *
shared_name *
capacity *
	container 
э
?read_batch_features/file_name_queue/file_name_queue_EnqueueManyQueueEnqueueManyV2#read_batch_features/file_name_queue1read_batch_features/file_name_queue/RandomShuffle"/device:CPU:0*
Tcomponents
2*

timeout_msџџџџџџџџџ

9read_batch_features/file_name_queue/file_name_queue_CloseQueueCloseV2#read_batch_features/file_name_queue"/device:CPU:0*
cancel_pending_enqueues( 

;read_batch_features/file_name_queue/file_name_queue_Close_1QueueCloseV2#read_batch_features/file_name_queue"/device:CPU:0*
cancel_pending_enqueues(

8read_batch_features/file_name_queue/file_name_queue_SizeQueueSizeV2#read_batch_features/file_name_queue"/device:CPU:0*
_output_shapes
: 
М
+read_batch_features/file_name_queue/ToFloatCast8read_batch_features/file_name_queue/file_name_queue_Size"/device:CPU:0*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0
}
)read_batch_features/file_name_queue/mul/yConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB
 *   =
Ж
'read_batch_features/file_name_queue/mulMul+read_batch_features/file_name_queue/ToFloat)read_batch_features/file_name_queue/mul/y"/device:CPU:0*
_output_shapes
: *
T0
У
<read_batch_features/file_name_queue/fraction_of_32_full/tagsConst"/device:CPU:0*H
value?B= B7read_batch_features/file_name_queue/fraction_of_32_full*
dtype0*
_output_shapes
: 
п
7read_batch_features/file_name_queue/fraction_of_32_fullScalarSummary<read_batch_features/file_name_queue/fraction_of_32_full/tags'read_batch_features/file_name_queue/mul"/device:CPU:0*
T0*
_output_shapes
: 
Є
)read_batch_features/read/TFRecordReaderV2TFRecordReaderV2"/device:CPU:0*
	container *
_output_shapes
: *
compression_typeGZIP*
shared_name 

5read_batch_features/read/ReaderReadUpToV2/num_recordsConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
value	B	 R(

)read_batch_features/read/ReaderReadUpToV2ReaderReadUpToV2)read_batch_features/read/TFRecordReaderV2#read_batch_features/file_name_queue5read_batch_features/read/ReaderReadUpToV2/num_records"/device:CPU:0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
j
read_batch_features/ConstConst"/device:CPU:0*
value	B
 Z*
dtype0
*
_output_shapes
: 
ќ
(read_batch_features/random_shuffle_queueRandomShuffleQueueV2"/device:CPU:0*
_output_shapes
: *
component_types
2*
shapes
: : *

seed *
shared_name *
capacityN*
min_after_dequeueM*
	container *
seed2 

4read_batch_features/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2(read_batch_features/random_shuffle_queue)read_batch_features/read/ReaderReadUpToV2+read_batch_features/read/ReaderReadUpToV2:1"/device:CPU:0*
Tcomponents
2*

timeout_msџџџџџџџџџ

.read_batch_features/random_shuffle_queue_CloseQueueCloseV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
cancel_pending_enqueues( 

0read_batch_features/random_shuffle_queue_Close_1QueueCloseV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
cancel_pending_enqueues(

-read_batch_features/random_shuffle_queue_SizeQueueSizeV2(read_batch_features/random_shuffle_queue"/device:CPU:0*
_output_shapes
: 
k
read_batch_features/sub/yConst"/device:CPU:0*
value
B :M*
dtype0*
_output_shapes
: 

read_batch_features/subSub-read_batch_features/random_shuffle_queue_Sizeread_batch_features/sub/y"/device:CPU:0*
T0*
_output_shapes
: 
n
read_batch_features/Maximum/xConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

read_batch_features/MaximumMaximumread_batch_features/Maximum/xread_batch_features/sub"/device:CPU:0*
T0*
_output_shapes
: 

read_batch_features/ToFloatCastread_batch_features/Maximum"/device:CPU:0*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 
m
read_batch_features/mul/yConst"/device:CPU:0*
valueB
 *<*
dtype0*
_output_shapes
: 

read_batch_features/mulMulread_batch_features/ToFloatread_batch_features/mul/y"/device:CPU:0*
T0*
_output_shapes
: 
Й
7read_batch_features/fraction_over_9880_of_120_full/tagsConst"/device:CPU:0*C
value:B8 B2read_batch_features/fraction_over_9880_of_120_full*
dtype0*
_output_shapes
: 
Х
2read_batch_features/fraction_over_9880_of_120_fullScalarSummary7read_batch_features/fraction_over_9880_of_120_full/tagsread_batch_features/mul"/device:CPU:0*
_output_shapes
: *
T0
f
read_batch_features/nConst"/device:CPU:0*
value	B :(*
dtype0*
_output_shapes
: 
б
read_batch_featuresQueueDequeueManyV2(read_batch_features/random_shuffle_queueread_batch_features/n"/device:CPU:0*

timeout_msџџџџџџџџџ*
component_types
2* 
_output_shapes
:(:(
x
&read_batch_features/ParseExample/ConstConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
z
(read_batch_features/ParseExample/Const_1Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_2Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_3Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_4Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_5Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_6Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_7Const"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB 
z
(read_batch_features/ParseExample/Const_8Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
z
(read_batch_features/ParseExample/Const_9Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
{
)read_batch_features/ParseExample/Const_10Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_11Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 
{
)read_batch_features/ParseExample/Const_12Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_13Const"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_14Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_15Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 
{
)read_batch_features/ParseExample/Const_16Const"/device:CPU:0*
valueB	 *
dtype0	*
_output_shapes
: 

3read_batch_features/ParseExample/ParseExample/namesConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB 

:read_batch_features/ParseExample/ParseExample/dense_keys_0Const"/device:CPU:0*
valueB B
company_xf*
dtype0*
_output_shapes
: 
Ё
:read_batch_features/ParseExample/ParseExample/dense_keys_1Const"/device:CPU:0*(
valueB Bdropoff_census_tract_xf*
dtype0*
_output_shapes
: 
Ѓ
:read_batch_features/ParseExample/ParseExample/dense_keys_2Const"/device:CPU:0**
value!B Bdropoff_community_area_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_3Const"/device:CPU:0*
dtype0*
_output_shapes
: *$
valueB Bdropoff_latitude_xf

:read_batch_features/ParseExample/ParseExample/dense_keys_4Const"/device:CPU:0*%
valueB Bdropoff_longitude_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_5Const"/device:CPU:0*
valueB Bfare_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_6Const"/device:CPU:0* 
valueB Bpayment_type_xf*
dtype0*
_output_shapes
: 
 
:read_batch_features/ParseExample/ParseExample/dense_keys_7Const"/device:CPU:0*'
valueB Bpickup_census_tract_xf*
dtype0*
_output_shapes
: 
Ђ
:read_batch_features/ParseExample/ParseExample/dense_keys_8Const"/device:CPU:0*)
value B Bpickup_community_area_xf*
dtype0*
_output_shapes
: 

:read_batch_features/ParseExample/ParseExample/dense_keys_9Const"/device:CPU:0*#
valueB Bpickup_latitude_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_10Const"/device:CPU:0*$
valueB Bpickup_longitude_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_11Const"/device:CPU:0*
valueB Btips_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_12Const"/device:CPU:0*
valueB Btrip_miles_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_13Const"/device:CPU:0* 
valueB Btrip_seconds_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_14Const"/device:CPU:0*"
valueB Btrip_start_day_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_15Const"/device:CPU:0*#
valueB Btrip_start_hour_xf*
dtype0*
_output_shapes
: 

;read_batch_features/ParseExample/ParseExample/dense_keys_16Const"/device:CPU:0*
dtype0*
_output_shapes
: *$
valueB Btrip_start_month_xf
ю
-read_batch_features/ParseExample/ParseExampleParseExampleread_batch_features:13read_batch_features/ParseExample/ParseExample/names:read_batch_features/ParseExample/ParseExample/dense_keys_0:read_batch_features/ParseExample/ParseExample/dense_keys_1:read_batch_features/ParseExample/ParseExample/dense_keys_2:read_batch_features/ParseExample/ParseExample/dense_keys_3:read_batch_features/ParseExample/ParseExample/dense_keys_4:read_batch_features/ParseExample/ParseExample/dense_keys_5:read_batch_features/ParseExample/ParseExample/dense_keys_6:read_batch_features/ParseExample/ParseExample/dense_keys_7:read_batch_features/ParseExample/ParseExample/dense_keys_8:read_batch_features/ParseExample/ParseExample/dense_keys_9;read_batch_features/ParseExample/ParseExample/dense_keys_10;read_batch_features/ParseExample/ParseExample/dense_keys_11;read_batch_features/ParseExample/ParseExample/dense_keys_12;read_batch_features/ParseExample/ParseExample/dense_keys_13;read_batch_features/ParseExample/ParseExample/dense_keys_14;read_batch_features/ParseExample/ParseExample/dense_keys_15;read_batch_features/ParseExample/ParseExample/dense_keys_16&read_batch_features/ParseExample/Const(read_batch_features/ParseExample/Const_1(read_batch_features/ParseExample/Const_2(read_batch_features/ParseExample/Const_3(read_batch_features/ParseExample/Const_4(read_batch_features/ParseExample/Const_5(read_batch_features/ParseExample/Const_6(read_batch_features/ParseExample/Const_7(read_batch_features/ParseExample/Const_8(read_batch_features/ParseExample/Const_9)read_batch_features/ParseExample/Const_10)read_batch_features/ParseExample/Const_11)read_batch_features/ParseExample/Const_12)read_batch_features/ParseExample/Const_13)read_batch_features/ParseExample/Const_14)read_batch_features/ParseExample/Const_15)read_batch_features/ParseExample/Const_16"/device:CPU:0*z
_output_shapesh
f:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(*
Nsparse *
sparse_types
 *4
dense_shapes$
": : : : : : : : : : : : : : : : : *
Tdense
2											*
Ndense
С
read_batch_features/fifo_queueFIFOQueueV2"/device:CPU:0*
capacityd*
	container *
_output_shapes
: *)
component_types
2											*
shapes
 *
shared_name 
y
#read_batch_features/fifo_queue_SizeQueueSizeV2read_batch_features/fifo_queue"/device:CPU:0*
_output_shapes
: 

read_batch_features/CastCast#read_batch_features/fifo_queue_Size"/device:CPU:0*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 
o
read_batch_features/mul_1/yConst"/device:CPU:0*
valueB
 *
з#<*
dtype0*
_output_shapes
: 

read_batch_features/mul_1Mulread_batch_features/Castread_batch_features/mul_1/y"/device:CPU:0*
T0*
_output_shapes
: 

bread_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full/tagsConst"/device:CPU:0*
dtype0*
_output_shapes
: *n
valueeBc B]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full

]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_fullScalarSummarybread_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full/tagsread_batch_features/mul_1"/device:CPU:0*
T0*
_output_shapes
: 

&read_batch_features/fifo_queue_enqueueQueueEnqueueV2read_batch_features/fifo_queue-read_batch_features/ParseExample/ParseExample/read_batch_features/ParseExample/ParseExample:1/read_batch_features/ParseExample/ParseExample:2/read_batch_features/ParseExample/ParseExample:3/read_batch_features/ParseExample/ParseExample:4/read_batch_features/ParseExample/ParseExample:5/read_batch_features/ParseExample/ParseExample:6/read_batch_features/ParseExample/ParseExample:7/read_batch_features/ParseExample/ParseExample:8/read_batch_features/ParseExample/ParseExample:90read_batch_features/ParseExample/ParseExample:100read_batch_features/ParseExample/ParseExample:110read_batch_features/ParseExample/ParseExample:120read_batch_features/ParseExample/ParseExample:130read_batch_features/ParseExample/ParseExample:140read_batch_features/ParseExample/ParseExample:150read_batch_features/ParseExample/ParseExample:16read_batch_features"/device:CPU:0*%
Tcomponents
2											*

timeout_msџџџџџџџџџ

(read_batch_features/fifo_queue_enqueue_1QueueEnqueueV2read_batch_features/fifo_queue-read_batch_features/ParseExample/ParseExample/read_batch_features/ParseExample/ParseExample:1/read_batch_features/ParseExample/ParseExample:2/read_batch_features/ParseExample/ParseExample:3/read_batch_features/ParseExample/ParseExample:4/read_batch_features/ParseExample/ParseExample:5/read_batch_features/ParseExample/ParseExample:6/read_batch_features/ParseExample/ParseExample:7/read_batch_features/ParseExample/ParseExample:8/read_batch_features/ParseExample/ParseExample:90read_batch_features/ParseExample/ParseExample:100read_batch_features/ParseExample/ParseExample:110read_batch_features/ParseExample/ParseExample:120read_batch_features/ParseExample/ParseExample:130read_batch_features/ParseExample/ParseExample:140read_batch_features/ParseExample/ParseExample:150read_batch_features/ParseExample/ParseExample:16read_batch_features"/device:CPU:0*%
Tcomponents
2											*

timeout_msџџџџџџџџџ

$read_batch_features/fifo_queue_CloseQueueCloseV2read_batch_features/fifo_queue"/device:CPU:0*
cancel_pending_enqueues( 

&read_batch_features/fifo_queue_Close_1QueueCloseV2read_batch_features/fifo_queue"/device:CPU:0*
cancel_pending_enqueues(
А
&read_batch_features/fifo_queue_DequeueQueueDequeueV2read_batch_features/fifo_queue"/device:CPU:0*)
component_types
2											*
_output_shapesn
l:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(*

timeout_msџџџџџџџџџ

Adnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
э
=dnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:5Adnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims/dim*
T0*
_output_shapes

:(*

Tdim0

8dnn/input_from_feature_columns/input_layer/fare_xf/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Fdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 

Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ј
@dnn/input_from_feature_columns/input_layer/fare_xf/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/fare_xf/ShapeFdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stackHdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/fare_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Bdnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

@dnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/fare_xf/strided_sliceBdnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
§
:dnn/input_from_feature_columns/input_layer/fare_xf/ReshapeReshape=dnn/input_from_feature_columns/input_layer/fare_xf/ExpandDims@dnn/input_from_feature_columns/input_layer/fare_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(

Gdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
њ
Cdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:12Gdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDims/dim*
T0*
_output_shapes

:(*

Tdim0

>dnn/input_from_feature_columns/input_layer/trip_miles_xf/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Ldnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Fdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/trip_miles_xf/ShapeLdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stackNdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

Hdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :

Fdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/trip_miles_xf/strided_sliceHdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:

@dnn/input_from_feature_columns/input_layer/trip_miles_xf/ReshapeReshapeCdnn/input_from_feature_columns/input_layer/trip_miles_xf/ExpandDimsFdnn/input_from_feature_columns/input_layer/trip_miles_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(

Idnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
ў
Ednn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:13Idnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0

@dnn/input_from_feature_columns/input_layer/trip_seconds_xf/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Ndnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
 
Hdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/trip_seconds_xf/ShapeNdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stackPdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask

Jdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
 
Hdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/trip_seconds_xf/strided_sliceJdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:

Bdnn/input_from_feature_columns/input_layer/trip_seconds_xf/ReshapeReshapeEdnn/input_from_feature_columns/input_layer/trip_seconds_xf/ExpandDimsHdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape/shape*
T0*
Tshape0*
_output_shapes

:(
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
ѕ
1dnn/input_from_feature_columns/input_layer/concatConcatV2:dnn/input_from_feature_columns/input_layer/fare_xf/Reshape@dnn/input_from_feature_columns/input_layer/trip_miles_xf/ReshapeBdnn/input_from_feature_columns/input_layer/trip_seconds_xf/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
T0*
N*
_output_shapes

:(*

Tidx0
Х
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"   d   *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
З
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *о%wО*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *о%w>*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0

Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:d*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2 

>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes

:d*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0

:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

:d
п
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
	container *
shape
:d*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
Ч
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
Ў
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
valueBd*    *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d
е
dnn/hiddenlayer_0/bias/part_0VarHandleOp*
	container *
shape:d*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0

>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d

'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d
v
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes

:d
О
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*
transpose_a( *
_output_shapes

:(d*
transpose_b( 

%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d
n
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
T0*
_output_shapes
:d

dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*
_output_shapes

:(d
b
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:(d
[
dnn/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
y
dnn/zero_fraction/EqualEqualdnn/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:(d

dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(d
h
dnn/zero_fraction/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
 
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values
Ћ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
Х
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"d   F   *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:
З
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *H`@О*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *H`@>*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:dF*

seed 

>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes

:dF*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0

:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

:dF
п
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
	container *
shape
:dF

@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0
Ч
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ў
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
valueBF*    *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F
е
dnn/hiddenlayer_1/bias/part_0VarHandleOp*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container *
shape:F*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_1/bias/part_0

>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
Н
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F

'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF
v
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
_output_shapes

:dF*
T0
Ѓ
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Reludnn/hiddenlayer_1/kernel*
T0*
transpose_a( *
_output_shapes

:(F*
transpose_b( 

%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F
n
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
_output_shapes
:F*
T0

dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
data_formatNHWC*
_output_shapes

:(F*
T0
b
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*
_output_shapes

:(F
]
dnn/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
dnn/zero_fraction_1/EqualEqualdnn/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
_output_shapes

:(F*
T0

dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(F
j
dnn/zero_fraction_1/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
 
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1/activation

 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
Х
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"F   0   *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
:
З
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *йчfО*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
З
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *йчf>*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:F0

>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
Ќ
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:F0

:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:F0
п
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
	container *
shape
:F0*
dtype0*
_output_shapes
: 

@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0
Ч
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
Ў
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:0*
valueB0*    *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
е
dnn/hiddenlayer_2/bias/part_0VarHandleOp*
shape:0*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
	container 

>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0

'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
v
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
_output_shapes

:F0*
T0
Ѓ
dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Reludnn/hiddenlayer_2/kernel*
transpose_b( *
T0*
transpose_a( *
_output_shapes

:(0

%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0
n
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
T0*
_output_shapes
:0

dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*
data_formatNHWC*
_output_shapes

:(0
b
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*
_output_shapes

:(0
]
dnn/zero_fraction_2/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
}
dnn/zero_fraction_2/EqualEqualdnn/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:(0

dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(0
j
dnn/zero_fraction_2/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
 
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values
­
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Relu*
_output_shapes
: *
T0
Х
@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"0   "   *2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0
З
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *О*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes
: 
З
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *>*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes
: 

Hdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:0"*

seed 

>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0
Ќ
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
_output_shapes

:0"

:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
_output_shapes

:0"
п
dnn/hiddenlayer_3/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_3/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
	container *
shape
:0"

@dnn/hiddenlayer_3/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 
и
&dnn/hiddenlayer_3/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/kernel/part_0:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
Ч
3dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
Ў
/dnn/hiddenlayer_3/bias/part_0/Initializer/zerosConst*
valueB"*    *0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"
е
dnn/hiddenlayer_3/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_3/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
	container *
shape:"

>dnn/hiddenlayer_3/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
Ч
$dnn/hiddenlayer_3/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/bias/part_0/dnn/hiddenlayer_3/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
dtype0
Н
1dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0

'dnn/hiddenlayer_3/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
v
dnn/hiddenlayer_3/kernelIdentity'dnn/hiddenlayer_3/kernel/ReadVariableOp*
T0*
_output_shapes

:0"
Ѓ
dnn/hiddenlayer_3/MatMulMatMuldnn/hiddenlayer_2/Reludnn/hiddenlayer_3/kernel*
T0*
transpose_a( *
_output_shapes

:("*
transpose_b( 

%dnn/hiddenlayer_3/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"
n
dnn/hiddenlayer_3/biasIdentity%dnn/hiddenlayer_3/bias/ReadVariableOp*
T0*
_output_shapes
:"

dnn/hiddenlayer_3/BiasAddBiasAdddnn/hiddenlayer_3/MatMuldnn/hiddenlayer_3/bias*
T0*
data_formatNHWC*
_output_shapes

:("
b
dnn/hiddenlayer_3/ReluReludnn/hiddenlayer_3/BiasAdd*
T0*
_output_shapes

:("
]
dnn/zero_fraction_3/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
}
dnn/zero_fraction_3/EqualEqualdnn/hiddenlayer_3/Reludnn/zero_fraction_3/zero*
T0*
_output_shapes

:("

dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:("
j
dnn/zero_fraction_3/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
 
2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_3/fraction_of_zero_values*
dtype0*
_output_shapes
: 
­
-dnn/dnn/hiddenlayer_3/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 

$dnn/dnn/hiddenlayer_3/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_3/activation*
dtype0*
_output_shapes
: 

 dnn/dnn/hiddenlayer_3/activationHistogramSummary$dnn/dnn/hiddenlayer_3/activation/tagdnn/hiddenlayer_3/Relu*
_output_shapes
: *
T0
З
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB""      *+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
:
Љ
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *їќгО*+
_class!
loc:@dnn/logits/kernel/part_0
Љ
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *їќг>*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 

Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:"*

seed *
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
seed2 
ў
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 

7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:"

3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

:"*
T0*+
_class!
loc:@dnn/logits/kernel/part_0
Ъ
dnn/logits/kernel/part_0VarHandleOp*
	container *
shape
:"*
dtype0*
_output_shapes
: *)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0

9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
М
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
В
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
 
(dnn/logits/bias/part_0/Initializer/zerosConst*
valueB*    *)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
Р
dnn/logits/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
	container *
shape:
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
Ћ
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*)
_class
loc:@dnn/logits/bias/part_0*
dtype0
Ј
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
y
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
h
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
_output_shapes

:"*
T0

dnn/logits/MatMulMatMuldnn/hiddenlayer_3/Reludnn/logits/kernel*
T0*
transpose_a( *
_output_shapes

:(*
transpose_b( 
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
T0*
_output_shapes
:

dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*
data_formatNHWC*
_output_shapes

:(
]
dnn/zero_fraction_4/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
y
dnn/zero_fraction_4/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_4/zero*
T0*
_output_shapes

:(

dnn/zero_fraction_4/CastCastdnn/zero_fraction_4/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(
j
dnn/zero_fraction_4/ConstConst*
valueB"       *
dtype0*
_output_shapes
:

dnn/zero_fraction_4/MeanMeandnn/zero_fraction_4/Castdnn/zero_fraction_4/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits/fraction_of_zero_values

&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_4/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 

dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
т
Olinear/linear_model/company_xf/weights/part_0/Initializer/zeros/shape_as_tensorConst*
valueB"ђ     *@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:
Ь
Elinear/linear_model/company_xf/weights/part_0/Initializer/zeros/ConstConst*
valueB
 *    *@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
: 
н
?linear/linear_model/company_xf/weights/part_0/Initializer/zerosFillOlinear/linear_model/company_xf/weights/part_0/Initializer/zeros/shape_as_tensorElinear/linear_model/company_xf/weights/part_0/Initializer/zeros/Const*
_output_shapes
:	ђ*
T0*

index_type0*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0

-linear/linear_model/company_xf/weights/part_0VarHandleOp*>
shared_name/-linear/linear_model/company_xf/weights/part_0*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
	container *
shape:	ђ*
dtype0*
_output_shapes
: 
Ћ
Nlinear/linear_model/company_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

4linear/linear_model/company_xf/weights/part_0/AssignAssignVariableOp-linear/linear_model/company_xf/weights/part_0?linear/linear_model/company_xf/weights/part_0/Initializer/zeros*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0
ђ
Alinear/linear_model/company_xf/weights/part_0/Read/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*@
_class6
42loc:@linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

:linear/linear_model/linear_model/company_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
н
6linear/linear_model/linear_model/company_xf/ExpandDims
ExpandDims&read_batch_features/fifo_queue_Dequeue:linear/linear_model/linear_model/company_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Jlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
м
Hlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_valueCastJlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
ћ
Dlinear/linear_model/linear_model/company_xf/to_sparse_input/NotEqualNotEqual6linear/linear_model/linear_model/company_xf/ExpandDimsHlinear/linear_model/linear_model/company_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
Ф
Clinear/linear_model/linear_model/company_xf/to_sparse_input/indicesWhereDlinear/linear_model/linear_model/company_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Blinear/linear_model/linear_model/company_xf/to_sparse_input/valuesGatherNd6linear/linear_model/linear_model/company_xf/ExpandDimsClinear/linear_model/linear_model/company_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
 
Glinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              
|
9linear/linear_model/linear_model/company_xf/num_buckets/xConst*
value
B :ђ*
dtype0*
_output_shapes
: 
К
7linear/linear_model/linear_model/company_xf/num_bucketsCast9linear/linear_model/linear_model/company_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
t
2linear/linear_model/linear_model/company_xf/zero/xConst*
dtype0*
_output_shapes
: *
value	B : 
Ќ
0linear/linear_model/linear_model/company_xf/zeroCast2linear/linear_model/linear_model/company_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
м
0linear/linear_model/linear_model/company_xf/LessLessBlinear/linear_model/linear_model/company_xf/to_sparse_input/values0linear/linear_model/linear_model/company_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ
ѓ
8linear/linear_model/linear_model/company_xf/GreaterEqualGreaterEqualBlinear/linear_model/linear_model/company_xf/to_sparse_input/values7linear/linear_model/linear_model/company_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ж
8linear/linear_model/linear_model/company_xf/out_of_range	LogicalOr0linear/linear_model/linear_model/company_xf/Less8linear/linear_model/linear_model/company_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Г
1linear/linear_model/linear_model/company_xf/ShapeShapeBlinear/linear_model/linear_model/company_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:
w
5linear/linear_model/linear_model/company_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
В
3linear/linear_model/linear_model/company_xf/ToInt64Cast5linear/linear_model/linear_model/company_xf/ToInt64/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
ъ
:linear/linear_model/linear_model/company_xf/default_valuesFill1linear/linear_model/linear_model/company_xf/Shape3linear/linear_model/linear_model/company_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Є
2linear/linear_model/linear_model/company_xf/SelectSelect8linear/linear_model/linear_model/company_xf/out_of_range:linear/linear_model/linear_model/company_xf/default_valuesBlinear/linear_model/linear_model/company_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
Э
8linear/linear_model/linear_model/company_xf/Shape_1/CastCastGlinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

?linear/linear_model/linear_model/company_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Alinear/linear_model/linear_model/company_xf/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Alinear/linear_model/linear_model/company_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
м
9linear/linear_model/linear_model/company_xf/strided_sliceStridedSlice8linear/linear_model/linear_model/company_xf/Shape_1/Cast?linear/linear_model/linear_model/company_xf/strided_slice/stackAlinear/linear_model/linear_model/company_xf/strided_slice/stack_1Alinear/linear_model/linear_model/company_xf/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

4linear/linear_model/linear_model/company_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
х
2linear/linear_model/linear_model/company_xf/Cast/xPack9linear/linear_model/linear_model/company_xf/strided_slice4linear/linear_model/linear_model/company_xf/Cast/x/1*
N*
_output_shapes
:*
T0*

axis 
А
0linear/linear_model/linear_model/company_xf/CastCast2linear/linear_model/linear_model/company_xf/Cast/x*
Truncate( *

DstT0	*
_output_shapes
:*

SrcT0
Й
9linear/linear_model/linear_model/company_xf/SparseReshapeSparseReshapeClinear/linear_model/linear_model/company_xf/to_sparse_input/indicesGlinear/linear_model/linear_model/company_xf/to_sparse_input/dense_shape0linear/linear_model/linear_model/company_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
А
Blinear/linear_model/linear_model/company_xf/SparseReshape/IdentityIdentity2linear/linear_model/linear_model/company_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
Љ
:linear/linear_model/linear_model/company_xf/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

Dlinear/linear_model/linear_model/company_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Clinear/linear_model/linear_model/company_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
С
>linear/linear_model/linear_model/company_xf/weighted_sum/SliceSlice;linear/linear_model/linear_model/company_xf/SparseReshape:1Dlinear/linear_model/linear_model/company_xf/weighted_sum/Slice/beginClinear/linear_model/linear_model/company_xf/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:

>linear/linear_model/linear_model/company_xf/weighted_sum/ConstConst*
dtype0*
_output_shapes
:*
valueB: 

=linear/linear_model/linear_model/company_xf/weighted_sum/ProdProd>linear/linear_model/linear_model/company_xf/weighted_sum/Slice>linear/linear_model/linear_model/company_xf/weighted_sum/Const*

Tidx0*
	keep_dims( *
T0	*
_output_shapes
: 

Ilinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Flinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
с
Alinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2GatherV2;linear/linear_model/linear_model/company_xf/SparseReshape:1Ilinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/indicesFlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	

?linear/linear_model/linear_model/company_xf/weighted_sum/Cast/xPack=linear/linear_model/linear_model/company_xf/weighted_sum/ProdAlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
П
Flinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshapeSparseReshape9linear/linear_model/linear_model/company_xf/SparseReshape;linear/linear_model/linear_model/company_xf/SparseReshape:1?linear/linear_model/linear_model/company_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
Э
Olinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/IdentityIdentityBlinear/linear_model/linear_model/company_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 

Elinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqualGreaterEqualOlinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/IdentityGlinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
Р
>linear/linear_model/linear_model/company_xf/weighted_sum/WhereWhereElinear/linear_model/linear_model/company_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Flinear/linear_model/linear_model/company_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeReshape>linear/linear_model/linear_model/company_xf/weighted_sum/WhereFlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Hlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ј
Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1GatherV2Flinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeHlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0

Hlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
§
Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2GatherV2Olinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape/Identity@linear/linear_model/linear_model/company_xf/weighted_sum/ReshapeHlinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
М
Alinear/linear_model/linear_model/company_xf/weighted_sum/IdentityIdentityHlinear/linear_model/linear_model/company_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Rlinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
ї
`linear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsClinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_1Clinear/linear_model/linear_model/company_xf/weighted_sum/GatherV2_2Alinear/linear_model/linear_model/company_xf/weighted_sum/IdentityRlinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/Const*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ*
T0	
Е
dlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
З
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
З
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Ѕ
^linear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlice`linear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsdlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackflinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ

Ulinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/CastCast^linear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ

Wlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueblinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ
ї
flinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *M
_classC
A?loc:@linear/linear_model/linear_model/company_xf/ReadVariableOp

alinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2:linear/linear_model/linear_model/company_xf/ReadVariableOpWlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Uniqueflinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0*M
_classC
A?loc:@linear/linear_model/linear_model/company_xf/ReadVariableOp

jlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityalinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
Р
Plinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumjlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityYlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Unique:1Ulinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0

Hlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
Л
Blinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1Reshapeblinear/linear_model/linear_model/company_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Hlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
Ю
>linear/linear_model/linear_model/company_xf/weighted_sum/ShapeShapePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Llinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Flinear/linear_model/linear_model/company_xf/weighted_sum/strided_sliceStridedSlice>linear/linear_model/linear_model/company_xf/weighted_sum/ShapeLlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stackNlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_1Nlinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

@linear/linear_model/linear_model/company_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :

>linear/linear_model/linear_model/company_xf/weighted_sum/stackPack@linear/linear_model/linear_model/company_xf/weighted_sum/stack/0Flinear/linear_model/linear_model/company_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:

=linear/linear_model/linear_model/company_xf/weighted_sum/TileTileBlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_1>linear/linear_model/linear_model/company_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
д
Clinear/linear_model/linear_model/company_xf/weighted_sum/zeros_like	ZerosLikePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
Ъ
8linear/linear_model/linear_model/company_xf/weighted_sumSelect=linear/linear_model/linear_model/company_xf/weighted_sum/TileClinear/linear_model/linear_model/company_xf/weighted_sum/zeros_likePlinear/linear_model/linear_model/company_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
Ш
?linear/linear_model/linear_model/company_xf/weighted_sum/Cast_1Cast;linear/linear_model/linear_model/company_xf/SparseReshape:1*
Truncate( *

DstT0*
_output_shapes
:*

SrcT0	

Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Ы
@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_1Slice?linear/linear_model/linear_model/company_xf/weighted_sum/Cast_1Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/beginElinear/linear_model/linear_model/company_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
И
@linear/linear_model/linear_model/company_xf/weighted_sum/Shape_1Shape8linear/linear_model/linear_model/company_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ь
@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_2Slice@linear/linear_model/linear_model/company_xf/weighted_sum/Shape_1Flinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/beginElinear/linear_model/linear_model/company_xf/weighted_sum/Slice_2/size*
_output_shapes
:*
T0*
Index0

Dlinear/linear_model/linear_model/company_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Я
?linear/linear_model/linear_model/company_xf/weighted_sum/concatConcatV2@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_1@linear/linear_model/linear_model/company_xf/weighted_sum/Slice_2Dlinear/linear_model/linear_model/company_xf/weighted_sum/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:

Blinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_2Reshape8linear/linear_model/linear_model/company_xf/weighted_sum?linear/linear_model/linear_model/company_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zerosConst*
valueB
*    *I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

Є
6linear/linear_model/dropoff_latitude_xf/weights/part_0VarHandleOp*
shape
:
*
dtype0*
_output_shapes
: *G
shared_name86linear/linear_model/dropoff_latitude_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0*
	container 
Н
Wlinear/linear_model/dropoff_latitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/dropoff_latitude_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0Hlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zeros*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0

Jlinear/linear_model/dropoff_latitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:
*I
_class?
=;loc:@linear/linear_model/dropoff_latitude_xf/weights/part_0

Clinear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ё
?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:3Clinear/linear_model/linear_model/dropoff_latitude_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Slinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
Qlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Mlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDimsQlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
ж
Llinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/dropoff_latitude_xf/ExpandDimsLlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Љ
Plinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Blinear/linear_model/linear_model/dropoff_latitude_xf/num_buckets/xConst*
dtype0*
_output_shapes
: *
value	B :

Ь
@linear/linear_model/linear_model/dropoff_latitude_xf/num_bucketsCastBlinear/linear_model/linear_model/dropoff_latitude_xf/num_buckets/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
}
;linear/linear_model/linear_model/dropoff_latitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/dropoff_latitude_xf/zeroCast;linear/linear_model/linear_model/dropoff_latitude_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
ї
9linear/linear_model/linear_model/dropoff_latitude_xf/LessLessKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values9linear/linear_model/linear_model/dropoff_latitude_xf/zero*#
_output_shapes
:џџџџџџџџџ*
T0	

Alinear/linear_model/linear_model/dropoff_latitude_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values@linear/linear_model/linear_model/dropoff_latitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/dropoff_latitude_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/dropoff_latitude_xf/LessAlinear/linear_model/linear_model/dropoff_latitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/dropoff_latitude_xf/ShapeShapeKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values*
_output_shapes
:*
T0	*
out_type0

>linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Ф
<linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64Cast>linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0

Clinear/linear_model/linear_model/dropoff_latitude_xf/default_valuesFill:linear/linear_model/linear_model/dropoff_latitude_xf/Shape<linear/linear_model/linear_model/dropoff_latitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ш
;linear/linear_model/linear_model/dropoff_latitude_xf/SelectSelectAlinear/linear_model/linear_model/dropoff_latitude_xf/out_of_rangeClinear/linear_model/linear_model/dropoff_latitude_xf/default_valuesKlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
п
Alinear/linear_model/linear_model/dropoff_latitude_xf/Shape_1/CastCastPlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Hlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/dropoff_latitude_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/dropoff_latitude_xf/Shape_1/CastHlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stackJlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

=linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 

;linear/linear_model/linear_model/dropoff_latitude_xf/Cast/xPackBlinear/linear_model/linear_model/dropoff_latitude_xf/strided_slice=linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x/1*
N*
_output_shapes
:*
T0*

axis 
Т
9linear/linear_model/linear_model/dropoff_latitude_xf/CastCast;linear/linear_model/linear_model/dropoff_latitude_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
н
Blinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/dropoff_latitude_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/dropoff_latitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/dropoff_latitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
К
Clinear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
х
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:

Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ConstConst*
dtype0*
_output_shapes
:*
valueB: 

Flinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SliceGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Const*

Tidx0*
	keep_dims( *
T0	*
_output_shapes
: 

Rlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Rlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0

Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ProdJlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
у
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshapeDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
И
Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
в
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ђ
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Њ
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/WhereOlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	

Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0
Ю
Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

[linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Є
ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Identity[linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
О
mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0

^linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ
Ѓ
`linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *V
_classL
JHloc:@linear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Л
jlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp`linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/dropoff_latitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0

slinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
ф
Ylinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ђ
Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
ж
Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1/shape*'
_output_shapes
:џџџџџџџџџ*
T0
*
Tshape0
р
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0

Ulinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
У
Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ѕ
Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Б
Flinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ц
Llinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ю
Alinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sumSelectFlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/TileLlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
к
Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/dropoff_latitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
я
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum*
_output_shapes
:*
T0*
out_type0

Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
Ё
Nlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
№
Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2/size*
_output_shapes
:*
T0*
Index0

Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
ѓ
Hlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
Ѓ
Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sumHlinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ъ
Ilinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zerosConst*
valueB
*    *J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

Ї
7linear/linear_model/dropoff_longitude_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *H
shared_name97linear/linear_model/dropoff_longitude_xf/weights/part_0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
	container *
shape
:

П
Xlinear/linear_model/dropoff_longitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 
Џ
>linear/linear_model/dropoff_longitude_xf/weights/part_0/AssignAssignVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0Ilinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zeros*
dtype0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0

Klinear/linear_model/dropoff_longitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*J
_class@
><loc:@linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Dlinear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ѓ
@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:4Dlinear/linear_model/linear_model/dropoff_longitude_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Tlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
№
Rlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_valueCastTlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Nlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/NotEqualNotEqual@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDimsRlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
и
Mlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indicesWhereNlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
­
Llinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/valuesGatherNd@linear/linear_model/linear_model/dropoff_longitude_xf/ExpandDimsMlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Њ
Qlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Clinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ю
Alinear/linear_model/linear_model/dropoff_longitude_xf/num_bucketsCastClinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
~
<linear/linear_model/linear_model/dropoff_longitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
Р
:linear/linear_model/linear_model/dropoff_longitude_xf/zeroCast<linear/linear_model/linear_model/dropoff_longitude_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
њ
:linear/linear_model/linear_model/dropoff_longitude_xf/LessLessLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values:linear/linear_model/linear_model/dropoff_longitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Blinear/linear_model/linear_model/dropoff_longitude_xf/GreaterEqualGreaterEqualLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/valuesAlinear/linear_model/linear_model/dropoff_longitude_xf/num_buckets*#
_output_shapes
:џџџџџџџџџ*
T0	
є
Blinear/linear_model/linear_model/dropoff_longitude_xf/out_of_range	LogicalOr:linear/linear_model/linear_model/dropoff_longitude_xf/LessBlinear/linear_model/linear_model/dropoff_longitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Ч
;linear/linear_model/linear_model/dropoff_longitude_xf/ShapeShapeLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

?linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Ц
=linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64Cast?linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Dlinear/linear_model/linear_model/dropoff_longitude_xf/default_valuesFill;linear/linear_model/linear_model/dropoff_longitude_xf/Shape=linear/linear_model/linear_model/dropoff_longitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ь
<linear/linear_model/linear_model/dropoff_longitude_xf/SelectSelectBlinear/linear_model/linear_model/dropoff_longitude_xf/out_of_rangeDlinear/linear_model/linear_model/dropoff_longitude_xf/default_valuesLlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/values*#
_output_shapes
:џџџџџџџџџ*
T0	
с
Blinear/linear_model/linear_model/dropoff_longitude_xf/Shape_1/CastCastQlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Ilinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Clinear/linear_model/linear_model/dropoff_longitude_xf/strided_sliceStridedSliceBlinear/linear_model/linear_model/dropoff_longitude_xf/Shape_1/CastIlinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stackKlinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_1Klinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask

>linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ

<linear/linear_model/linear_model/dropoff_longitude_xf/Cast/xPackClinear/linear_model/linear_model/dropoff_longitude_xf/strided_slice>linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x/1*
N*
_output_shapes
:*
T0*

axis 
Ф
:linear/linear_model/linear_model/dropoff_longitude_xf/CastCast<linear/linear_model/linear_model/dropoff_longitude_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
с
Clinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshapeSparseReshapeMlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/indicesQlinear/linear_model/linear_model/dropoff_longitude_xf/to_sparse_input/dense_shape:linear/linear_model/linear_model/dropoff_longitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Ф
Llinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape/IdentityIdentity<linear/linear_model/linear_model/dropoff_longitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
М
Dlinear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
щ
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SliceSliceElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/beginMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice/size*
_output_shapes
:*
T0	*
Index0

Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ё
Glinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ProdProdHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SliceHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 

Slinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2GatherV2Elinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Slinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/indicesPlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0
Ё
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast/xPackGlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ProdKlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
ч
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshapeSparseReshapeClinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshapeElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
с
Ylinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityIdentityLlinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Л
Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqualGreaterEqualYlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityQlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
д
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/WhereWhereOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ѓ
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
­
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeReshapeHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/WherePlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
 
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1GatherV2Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshapeJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
Ѕ
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2GatherV2Ylinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape/IdentityJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ReshapeRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
а
Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/IdentityIdentityRlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

\linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Љ
jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_1Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/GatherV2_2Klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Identity\linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
П
nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
С
plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
С
plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
з
hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicejlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsnlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackplinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	

_linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/CastCasthlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ*

SrcT0	
Ѕ
alinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquellinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0	*
out_idx0

plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *W
_classM
KIloc:@linear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Р
klinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Dlinear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOpalinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueplinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*W
_classM
KIloc:@linear/linear_model/linear_model/dropoff_longitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0

tlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityklinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:џџџџџџџџџ*
T0
ш
Zlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumtlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityclinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1_linear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ѓ
Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
й
Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1Reshapellinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Rlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
т
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ShapeShapeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ђ
Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
Ђ
Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ш
Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_sliceStridedSliceHlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/ShapeVlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stackXlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_1Xlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ј
Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stackPackJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack/0Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Д
Glinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/TileTileLlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_1Hlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/stack*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0
ш
Mlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/zeros_like	ZerosLikeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ђ
Blinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sumSelectGlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/TileMlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/zeros_likeZlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
м
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast_1CastElinear/linear_model/linear_model/dropoff_longitude_xf/SparseReshape:1*
Truncate( *

DstT0*
_output_shapes
:*

SrcT0	

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ѓ
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1SliceIlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Cast_1Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/beginOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1/size*
_output_shapes
:*
T0*
Index0
Ь
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Shape_1ShapeBlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum*
_output_shapes
:*
T0*
out_type0

Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
Ђ
Olinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
є
Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2SliceJlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Shape_1Plinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/beginOlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:

Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ї
Ilinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concatConcatV2Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_1Jlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Slice_2Nlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
І
Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_2ReshapeBlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sumIlinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ь
Tlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/shape_as_tensorConst*
valueB"ђ     *E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:
ж
Jlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/ConstConst*
valueB
 *    *E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
: 
ё
Dlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zerosFillTlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/shape_as_tensorJlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros/Const*
T0*

index_type0*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
:	ђ

2linear/linear_model/payment_type_xf/weights/part_0VarHandleOp*
	container *
shape:	ђ*
dtype0*
_output_shapes
: *C
shared_name42linear/linear_model/payment_type_xf/weights/part_0*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0
Е
Slinear/linear_model/payment_type_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

9linear/linear_model/payment_type_xf/weights/part_0/AssignAssignVariableOp2linear/linear_model/payment_type_xf/weights/part_0Dlinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
dtype0

Flinear/linear_model/payment_type_xf/weights/part_0/Read/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*E
_class;
97loc:@linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

?linear/linear_model/linear_model/payment_type_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
щ
;linear/linear_model/linear_model/payment_type_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:6?linear/linear_model/linear_model/payment_type_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Olinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ц
Mlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_valueCastOlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Ilinear/linear_model/linear_model/payment_type_xf/to_sparse_input/NotEqualNotEqual;linear/linear_model/linear_model/payment_type_xf/ExpandDimsMlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
Ю
Hlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indicesWhereIlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Glinear/linear_model/linear_model/payment_type_xf/to_sparse_input/valuesGatherNd;linear/linear_model/linear_model/payment_type_xf/ExpandDimsHlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Ѕ
Llinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

>linear/linear_model/linear_model/payment_type_xf/num_buckets/xConst*
value
B :ђ*
dtype0*
_output_shapes
: 
Ф
<linear/linear_model/linear_model/payment_type_xf/num_bucketsCast>linear/linear_model/linear_model/payment_type_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
y
7linear/linear_model/linear_model/payment_type_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
Ж
5linear/linear_model/linear_model/payment_type_xf/zeroCast7linear/linear_model/linear_model/payment_type_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
ы
5linear/linear_model/linear_model/payment_type_xf/LessLessGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values5linear/linear_model/linear_model/payment_type_xf/zero*#
_output_shapes
:џџџџџџџџџ*
T0	

=linear/linear_model/linear_model/payment_type_xf/GreaterEqualGreaterEqualGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values<linear/linear_model/linear_model/payment_type_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
х
=linear/linear_model/linear_model/payment_type_xf/out_of_range	LogicalOr5linear/linear_model/linear_model/payment_type_xf/Less=linear/linear_model/linear_model/payment_type_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Н
6linear/linear_model/linear_model/payment_type_xf/ShapeShapeGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:
|
:linear/linear_model/linear_model/payment_type_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
М
8linear/linear_model/linear_model/payment_type_xf/ToInt64Cast:linear/linear_model/linear_model/payment_type_xf/ToInt64/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
љ
?linear/linear_model/linear_model/payment_type_xf/default_valuesFill6linear/linear_model/linear_model/payment_type_xf/Shape8linear/linear_model/linear_model/payment_type_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
И
7linear/linear_model/linear_model/payment_type_xf/SelectSelect=linear/linear_model/linear_model/payment_type_xf/out_of_range?linear/linear_model/linear_model/payment_type_xf/default_valuesGlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
з
=linear/linear_model/linear_model/payment_type_xf/Shape_1/CastCastLlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Dlinear/linear_model/linear_model/payment_type_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ѕ
>linear/linear_model/linear_model/payment_type_xf/strided_sliceStridedSlice=linear/linear_model/linear_model/payment_type_xf/Shape_1/CastDlinear/linear_model/linear_model/payment_type_xf/strided_slice/stackFlinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_1Flinear/linear_model/linear_model/payment_type_xf/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

9linear/linear_model/linear_model/payment_type_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
є
7linear/linear_model/linear_model/payment_type_xf/Cast/xPack>linear/linear_model/linear_model/payment_type_xf/strided_slice9linear/linear_model/linear_model/payment_type_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
К
5linear/linear_model/linear_model/payment_type_xf/CastCast7linear/linear_model/linear_model/payment_type_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
Э
>linear/linear_model/linear_model/payment_type_xf/SparseReshapeSparseReshapeHlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/indicesLlinear/linear_model/linear_model/payment_type_xf/to_sparse_input/dense_shape5linear/linear_model/linear_model/payment_type_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
К
Glinear/linear_model/linear_model/payment_type_xf/SparseReshape/IdentityIdentity7linear/linear_model/linear_model/payment_type_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
Г
?linear/linear_model/linear_model/payment_type_xf/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ

Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
е
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/SliceSlice@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/beginHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:

Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/ConstConst*
dtype0*
_output_shapes
:*
valueB: 

Blinear/linear_model/linear_model/payment_type_xf/weighted_sum/ProdProdClinear/linear_model/linear_model/payment_type_xf/weighted_sum/SliceClinear/linear_model/linear_model/payment_type_xf/weighted_sum/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 

Nlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ѕ
Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2GatherV2@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Nlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/indicesKlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast/xPackBlinear/linear_model/linear_model/payment_type_xf/weighted_sum/ProdFlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
г
Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshapeSparseReshape>linear/linear_model/linear_model/payment_type_xf/SparseReshape@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
з
Tlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityIdentityGlinear/linear_model/linear_model/payment_type_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Llinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Ќ
Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqualGreaterEqualTlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityLlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
Ъ
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/WhereWhereJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeReshapeClinear/linear_model/linear_model/payment_type_xf/weighted_sum/WhereKlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1GatherV2Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshapeElinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2GatherV2Tlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape/IdentityElinear/linear_model/linear_model/payment_type_xf/weighted_sum/ReshapeMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2/axis*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	
Ц
Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/IdentityIdentityMlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

Wlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 

elinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_1Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/GatherV2_2Flinear/linear_model/linear_model/payment_type_xf/weighted_sum/IdentityWlinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/Const*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ*
T0	
К
ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
М
klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
М
klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
О
clinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceelinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsilinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackklinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0

Zlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/CastCastclinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/strided_slice*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ*

SrcT0	

\linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueglinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0	*
out_idx0

klinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *R
_classH
FDloc:@linear/linear_model/linear_model/payment_type_xf/ReadVariableOp
Ї
flinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2?linear/linear_model/linear_model/payment_type_xf/ReadVariableOp\linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Uniqueklinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*R
_classH
FDloc:@linear/linear_model/linear_model/payment_type_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

olinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityflinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:џџџџџџџџџ*
T0
д
Ulinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumolinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identity^linear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Unique:1Zlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0

Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   
Ъ
Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1Reshapeglinear/linear_model/linear_model/payment_type_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Mlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
и
Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/ShapeShapeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0

Qlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:

Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Џ
Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_sliceStridedSliceClinear/linear_model/linear_model/payment_type_xf/weighted_sum/ShapeQlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stackSlinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_1Slinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :

Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/stackPackElinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack/0Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/strided_slice*
N*
_output_shapes
:*
T0*

axis 
Ѕ
Blinear/linear_model/linear_model/payment_type_xf/weighted_sum/TileTileGlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_1Clinear/linear_model/linear_model/payment_type_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
о
Hlinear/linear_model/linear_model/payment_type_xf/weighted_sum/zeros_like	ZerosLikeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
о
=linear/linear_model/linear_model/payment_type_xf/weighted_sumSelectBlinear/linear_model/linear_model/payment_type_xf/weighted_sum/TileHlinear/linear_model/linear_model/payment_type_xf/weighted_sum/zeros_likeUlinear/linear_model/linear_model/payment_type_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
в
Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast_1Cast@linear/linear_model/linear_model/payment_type_xf/SparseReshape:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
п
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1SliceDlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Cast_1Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/beginJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Т
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Shape_1Shape=linear/linear_model/linear_model/payment_type_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
р
Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2SliceElinear/linear_model/linear_model/payment_type_xf/weighted_sum/Shape_1Klinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/beginJlinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:

Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
у
Dlinear/linear_model/linear_model/payment_type_xf/weighted_sum/concatConcatV2Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_1Elinear/linear_model/linear_model/payment_type_xf/weighted_sum/Slice_2Ilinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0

Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_2Reshape=linear/linear_model/linear_model/payment_type_xf/weighted_sumDlinear/linear_model/linear_model/payment_type_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ц
Glinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zerosConst*
valueB
*    *H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

Ё
5linear/linear_model/pickup_latitude_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *F
shared_name75linear/linear_model/pickup_latitude_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
	container *
shape
:

Л
Vlinear/linear_model/pickup_latitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 
Ї
<linear/linear_model/pickup_latitude_xf/weights/part_0/AssignAssignVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0Glinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zeros*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0

Ilinear/linear_model/pickup_latitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Blinear/linear_model/linear_model/pickup_latitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
я
>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDims
ExpandDims(read_batch_features/fifo_queue_Dequeue:9Blinear/linear_model/linear_model/pickup_latitude_xf/ExpandDims/dim*
_output_shapes

:(*

Tdim0*
T0	

Rlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ь
Plinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_valueCastRlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Llinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/NotEqualNotEqual>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDimsPlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/ignore_value*
_output_shapes

:(*
T0	
д
Klinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indicesWhereLlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ї
Jlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/valuesGatherNd>linear/linear_model/linear_model/pickup_latitude_xf/ExpandDimsKlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Ј
Olinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Alinear/linear_model/linear_model/pickup_latitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ъ
?linear/linear_model/linear_model/pickup_latitude_xf/num_bucketsCastAlinear/linear_model/linear_model/pickup_latitude_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
|
:linear/linear_model/linear_model/pickup_latitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
М
8linear/linear_model/linear_model/pickup_latitude_xf/zeroCast:linear/linear_model/linear_model/pickup_latitude_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
є
8linear/linear_model/linear_model/pickup_latitude_xf/LessLessJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values8linear/linear_model/linear_model/pickup_latitude_xf/zero*#
_output_shapes
:џџџџџџџџџ*
T0	

@linear/linear_model/linear_model/pickup_latitude_xf/GreaterEqualGreaterEqualJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values?linear/linear_model/linear_model/pickup_latitude_xf/num_buckets*#
_output_shapes
:џџџџџџџџџ*
T0	
ю
@linear/linear_model/linear_model/pickup_latitude_xf/out_of_range	LogicalOr8linear/linear_model/linear_model/pickup_latitude_xf/Less@linear/linear_model/linear_model/pickup_latitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
У
9linear/linear_model/linear_model/pickup_latitude_xf/ShapeShapeJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

=linear/linear_model/linear_model/pickup_latitude_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Т
;linear/linear_model/linear_model/pickup_latitude_xf/ToInt64Cast=linear/linear_model/linear_model/pickup_latitude_xf/ToInt64/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0

Blinear/linear_model/linear_model/pickup_latitude_xf/default_valuesFill9linear/linear_model/linear_model/pickup_latitude_xf/Shape;linear/linear_model/linear_model/pickup_latitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ф
:linear/linear_model/linear_model/pickup_latitude_xf/SelectSelect@linear/linear_model/linear_model/pickup_latitude_xf/out_of_rangeBlinear/linear_model/linear_model/pickup_latitude_xf/default_valuesJlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/values*#
_output_shapes
:џџџџџџџџџ*
T0	
н
@linear/linear_model/linear_model/pickup_latitude_xf/Shape_1/CastCastOlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Glinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Alinear/linear_model/linear_model/pickup_latitude_xf/strided_sliceStridedSlice@linear/linear_model/linear_model/pickup_latitude_xf/Shape_1/CastGlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stackIlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_1Ilinear/linear_model/linear_model/pickup_latitude_xf/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 

<linear/linear_model/linear_model/pickup_latitude_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
§
:linear/linear_model/linear_model/pickup_latitude_xf/Cast/xPackAlinear/linear_model/linear_model/pickup_latitude_xf/strided_slice<linear/linear_model/linear_model/pickup_latitude_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Р
8linear/linear_model/linear_model/pickup_latitude_xf/CastCast:linear/linear_model/linear_model/pickup_latitude_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
й
Alinear/linear_model/linear_model/pickup_latitude_xf/SparseReshapeSparseReshapeKlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/indicesOlinear/linear_model/linear_model/pickup_latitude_xf/to_sparse_input/dense_shape8linear/linear_model/linear_model/pickup_latitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Р
Jlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape/IdentityIdentity:linear/linear_model/linear_model/pickup_latitude_xf/Select*#
_output_shapes
:џџџџџџџџџ*
T0	
И
Blinear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
с
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SliceSliceClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/beginKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice/size*
_output_shapes
:*
T0	*
Index0

Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ProdProdFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SliceFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	

Qlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2GatherV2Clinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Qlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/indicesNlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast/xPackElinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ProdIlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
п
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshapeSparseReshapeAlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshapeClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
н
Wlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityIdentityJlinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape/Identity*#
_output_shapes
:џџџџџџџџџ*
T0	

Olinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Е
Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqualGreaterEqualWlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityOlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
а
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/WhereWhereMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ё
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ї
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapeReshapeFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/WhereNlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1GatherV2Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshapeHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0	

Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2GatherV2Wlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape/IdentityHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ь
Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/IdentityIdentityPlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Zlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 

hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_1Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/GatherV2_2Ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/IdentityZlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
Н
llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
П
nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
П
nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Э
flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicehlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsllinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stacknlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0*
shrink_axis_mask

]linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/CastCastflinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ
Ё
_linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquejlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *U
_classK
IGloc:@linear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Ж
ilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Blinear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp_linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Uniquenlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*U
_classK
IGloc:@linear/linear_model/linear_model/pickup_latitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

rlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityilinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
р
Xlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumrlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityalinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1]linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0
Ё
Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
г
Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1Reshapejlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Plinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
о
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ShapeShapeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0

Tlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
 
Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
О
Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_sliceStridedSliceFlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/ShapeTlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stackVlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_1Vlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
Ђ
Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stackPackHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack/0Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ў
Elinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/TileTileJlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_1Flinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ф
Klinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/zeros_like	ZerosLikeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ъ
@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sumSelectElinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/TileKlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/zeros_likeXlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
и
Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast_1CastClinear/linear_model/linear_model/pickup_latitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ы
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1SliceGlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Cast_1Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/beginMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ш
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Shape_1Shape@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
 
Mlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
ь
Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2SliceHlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Shape_1Nlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/beginMlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2/size*
_output_shapes
:*
T0*
Index0

Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
я
Glinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concatConcatV2Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_1Hlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Slice_2Llinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
 
Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_2Reshape@linear/linear_model/linear_model/pickup_latitude_xf/weighted_sumGlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zerosConst*
valueB
*    *I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

Є
6linear/linear_model/pickup_longitude_xf/weights/part_0VarHandleOp*
shape
:
*
dtype0*
_output_shapes
: *G
shared_name86linear/linear_model/pickup_longitude_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
	container 
Н
Wlinear/linear_model/pickup_longitude_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/pickup_longitude_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0Hlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zeros*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0

Jlinear/linear_model/pickup_longitude_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Clinear/linear_model/linear_model/pickup_longitude_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ђ
?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:10Clinear/linear_model/linear_model/pickup_longitude_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Slinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
Qlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Mlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDimsQlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
ж
Llinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/pickup_longitude_xf/ExpandDimsLlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indices*#
_output_shapes
:џџџџџџџџџ*
Tindices0	*
Tparams0	
Љ
Plinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Blinear/linear_model/linear_model/pickup_longitude_xf/num_buckets/xConst*
value	B :
*
dtype0*
_output_shapes
: 
Ь
@linear/linear_model/linear_model/pickup_longitude_xf/num_bucketsCastBlinear/linear_model/linear_model/pickup_longitude_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
}
;linear/linear_model/linear_model/pickup_longitude_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/pickup_longitude_xf/zeroCast;linear/linear_model/linear_model/pickup_longitude_xf/zero/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
ї
9linear/linear_model/linear_model/pickup_longitude_xf/LessLessKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values9linear/linear_model/linear_model/pickup_longitude_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

Alinear/linear_model/linear_model/pickup_longitude_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values@linear/linear_model/linear_model/pickup_longitude_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/pickup_longitude_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/pickup_longitude_xf/LessAlinear/linear_model/linear_model/pickup_longitude_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/pickup_longitude_xf/ShapeShapeKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values*
_output_shapes
:*
T0	*
out_type0

>linear/linear_model/linear_model/pickup_longitude_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Ф
<linear/linear_model/linear_model/pickup_longitude_xf/ToInt64Cast>linear/linear_model/linear_model/pickup_longitude_xf/ToInt64/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0

Clinear/linear_model/linear_model/pickup_longitude_xf/default_valuesFill:linear/linear_model/linear_model/pickup_longitude_xf/Shape<linear/linear_model/linear_model/pickup_longitude_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ш
;linear/linear_model/linear_model/pickup_longitude_xf/SelectSelectAlinear/linear_model/linear_model/pickup_longitude_xf/out_of_rangeClinear/linear_model/linear_model/pickup_longitude_xf/default_valuesKlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/values*#
_output_shapes
:џџџџџџџџџ*
T0	
п
Alinear/linear_model/linear_model/pickup_longitude_xf/Shape_1/CastCastPlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Hlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/pickup_longitude_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/pickup_longitude_xf/Shape_1/CastHlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stackJlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask

=linear/linear_model/linear_model/pickup_longitude_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 

;linear/linear_model/linear_model/pickup_longitude_xf/Cast/xPackBlinear/linear_model/linear_model/pickup_longitude_xf/strided_slice=linear/linear_model/linear_model/pickup_longitude_xf/Cast/x/1*
N*
_output_shapes
:*
T0*

axis 
Т
9linear/linear_model/linear_model/pickup_longitude_xf/CastCast;linear/linear_model/linear_model/pickup_longitude_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
н
Blinear/linear_model/linear_model/pickup_longitude_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/pickup_longitude_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/pickup_longitude_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/pickup_longitude_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
К
Clinear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:


Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
х
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice/size*
_output_shapes
:*
T0	*
Index0

Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SliceGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	

Rlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Rlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ProdJlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
у
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshapeDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
И
Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
в
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Ђ
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Њ
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/WhereOlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0
Ю
Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

[linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Є
ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Identity[linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
О
mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask 

^linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ
Ѓ
`linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *V
_classL
JHloc:@linear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Л
jlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp`linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/pickup_longitude_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ

slinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
ф
Ylinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:џџџџџџџџџ*

Tidx0
Ђ
Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
ж
Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1/shape*'
_output_shapes
:џџџџџџџџџ*
T0
*
Tshape0
р
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Ulinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
Ё
Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
У
Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask

Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ѕ
Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/strided_slice*
N*
_output_shapes
:*
T0*

axis 
Б
Flinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ц
Llinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ю
Alinear/linear_model/linear_model/pickup_longitude_xf/weighted_sumSelectFlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/TileLlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
к
Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/pickup_longitude_xf/SparseReshape:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
я
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Nlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
№
Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:

Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ѓ
Hlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
Ѓ
Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sumHlinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ф
Flinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zerosConst*
valueB*    *G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:

4linear/linear_model/trip_start_day_xf/weights/part_0VarHandleOp*
shape
:*
dtype0*
_output_shapes
: *E
shared_name64linear/linear_model/trip_start_day_xf/weights/part_0*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0*
	container 
Й
Ulinear/linear_model/trip_start_day_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 
Ѓ
;linear/linear_model/trip_start_day_xf/weights/part_0/AssignAssignVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0Flinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zeros*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0

Hlinear/linear_model/trip_start_day_xf/weights/part_0/Read/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:*G
_class=
;9loc:@linear/linear_model/trip_start_day_xf/weights/part_0

Alinear/linear_model/linear_model/trip_start_day_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
=linear/linear_model/linear_model/trip_start_day_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:14Alinear/linear_model/linear_model/trip_start_day_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Qlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ъ
Olinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_valueCastQlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Klinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/NotEqualNotEqual=linear/linear_model/linear_model/trip_start_day_xf/ExpandDimsOlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
в
Jlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indicesWhereKlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Є
Ilinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/valuesGatherNd=linear/linear_model/linear_model/trip_start_day_xf/ExpandDimsJlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Ї
Nlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

@linear/linear_model/linear_model/trip_start_day_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ш
>linear/linear_model/linear_model/trip_start_day_xf/num_bucketsCast@linear/linear_model/linear_model/trip_start_day_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
{
9linear/linear_model/linear_model/trip_start_day_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
К
7linear/linear_model/linear_model/trip_start_day_xf/zeroCast9linear/linear_model/linear_model/trip_start_day_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
ё
7linear/linear_model/linear_model/trip_start_day_xf/LessLessIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values7linear/linear_model/linear_model/trip_start_day_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

?linear/linear_model/linear_model/trip_start_day_xf/GreaterEqualGreaterEqualIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values>linear/linear_model/linear_model/trip_start_day_xf/num_buckets*#
_output_shapes
:џџџџџџџџџ*
T0	
ы
?linear/linear_model/linear_model/trip_start_day_xf/out_of_range	LogicalOr7linear/linear_model/linear_model/trip_start_day_xf/Less?linear/linear_model/linear_model/trip_start_day_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
С
8linear/linear_model/linear_model/trip_start_day_xf/ShapeShapeIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:
~
<linear/linear_model/linear_model/trip_start_day_xf/ToInt64/xConst*
value	B : *
dtype0*
_output_shapes
: 
Р
:linear/linear_model/linear_model/trip_start_day_xf/ToInt64Cast<linear/linear_model/linear_model/trip_start_day_xf/ToInt64/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
џ
Alinear/linear_model/linear_model/trip_start_day_xf/default_valuesFill8linear/linear_model/linear_model/trip_start_day_xf/Shape:linear/linear_model/linear_model/trip_start_day_xf/ToInt64*#
_output_shapes
:џџџџџџџџџ*
T0	*

index_type0
Р
9linear/linear_model/linear_model/trip_start_day_xf/SelectSelect?linear/linear_model/linear_model/trip_start_day_xf/out_of_rangeAlinear/linear_model/linear_model/trip_start_day_xf/default_valuesIlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
л
?linear/linear_model/linear_model/trip_start_day_xf/Shape_1/CastCastNlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shape*
Truncate( *

DstT0*
_output_shapes
:*

SrcT0	

Flinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
џ
@linear/linear_model/linear_model/trip_start_day_xf/strided_sliceStridedSlice?linear/linear_model/linear_model/trip_start_day_xf/Shape_1/CastFlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stackHlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_1Hlinear/linear_model/linear_model/trip_start_day_xf/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

;linear/linear_model/linear_model/trip_start_day_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
њ
9linear/linear_model/linear_model/trip_start_day_xf/Cast/xPack@linear/linear_model/linear_model/trip_start_day_xf/strided_slice;linear/linear_model/linear_model/trip_start_day_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
О
7linear/linear_model/linear_model/trip_start_day_xf/CastCast9linear/linear_model/linear_model/trip_start_day_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
е
@linear/linear_model/linear_model/trip_start_day_xf/SparseReshapeSparseReshapeJlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/indicesNlinear/linear_model/linear_model/trip_start_day_xf/to_sparse_input/dense_shape7linear/linear_model/linear_model/trip_start_day_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
О
Ilinear/linear_model/linear_model/trip_start_day_xf/SparseReshape/IdentityIdentity9linear/linear_model/linear_model/trip_start_day_xf/Select*#
_output_shapes
:џџџџџџџџџ*
T0	
Ж
Alinear/linear_model/linear_model/trip_start_day_xf/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:

Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
н
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SliceSliceBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/beginJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:

Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Dlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ProdProdElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SliceElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 

Plinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
§
Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2GatherV2Blinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Plinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/indicesMlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	

Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast/xPackDlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ProdHlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
л
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshapeSparseReshape@linear/linear_model/linear_model/trip_start_day_xf/SparseReshapeBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
л
Vlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityIdentityIlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Nlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
В
Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqualGreaterEqualVlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityNlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
Ю
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/WhereWhereLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GreaterEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
 
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Є
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeReshapeElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/WhereMlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape/shape*#
_output_shapes
:џџџџџџџџџ*
T0	*
Tshape0

Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1GatherV2Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshapeGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2GatherV2Vlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape/IdentityGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ReshapeOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ъ
Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/IdentityIdentityOlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

Ylinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 

glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_1Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/GatherV2_2Hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/IdentityYlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
М
klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
О
mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
О
mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
Ш
elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceglinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsklinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackmlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
Index0*
T0	*
shrink_axis_mask

\linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/CastCastelinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ

^linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *T
_classJ
HFloc:@linear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Б
hlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Alinear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp^linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Uniquemlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*T
_classJ
HFloc:@linear/linear_model/linear_model/trip_start_day_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

qlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityhlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:џџџџџџџџџ
м
Wlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumqlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identity`linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Unique:1\linear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
 
Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
а
Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1Reshapeilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Olinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
м
Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ShapeShapeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0

Slinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:

Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Й
Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_sliceStridedSliceElinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/ShapeSlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stackUlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_1Ulinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask

Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :

Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stackPackGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack/0Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ћ
Dlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/TileTileIlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_1Elinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/stack*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0
т
Jlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/zeros_like	ZerosLikeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ц
?linear/linear_model/linear_model/trip_start_day_xf/weighted_sumSelectDlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/TileJlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/zeros_likeWlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ж
Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast_1CastBlinear/linear_model/linear_model/trip_start_day_xf/SparseReshape:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
ч
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1SliceFlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Cast_1Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/beginLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ц
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Shape_1Shape?linear/linear_model/linear_model/trip_start_day_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:

Llinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
ш
Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2SliceGlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Shape_1Mlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/beginLlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2/size*
_output_shapes
:*
T0*
Index0

Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ы
Flinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concatConcatV2Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_1Glinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Slice_2Klinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_2Reshape?linear/linear_model/linear_model/trip_start_day_xf/weighted_sumFlinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ц
Glinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zerosConst*
valueB*    *H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:
Ё
5linear/linear_model/trip_start_hour_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *F
shared_name75linear/linear_model/trip_start_hour_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
	container *
shape
:
Л
Vlinear/linear_model/trip_start_hour_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 
Ї
<linear/linear_model/trip_start_hour_xf/weights/part_0/AssignAssignVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0Glinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zeros*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0

Ilinear/linear_model/trip_start_hour_xf/weights/part_0/Read/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*H
_class>
<:loc:@linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:

Blinear/linear_model/linear_model/trip_start_hour_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
№
>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:15Blinear/linear_model/linear_model/trip_start_hour_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Rlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ь
Plinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_valueCastRlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Llinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/NotEqualNotEqual>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDimsPlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/ignore_value*
_output_shapes

:(*
T0	
д
Klinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indicesWhereLlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/NotEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ї
Jlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/valuesGatherNd>linear/linear_model/linear_model/trip_start_hour_xf/ExpandDimsKlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Ј
Olinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shapeConst*%
valueB	"(              *
dtype0	*
_output_shapes
:

Alinear/linear_model/linear_model/trip_start_hour_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ъ
?linear/linear_model/linear_model/trip_start_hour_xf/num_bucketsCastAlinear/linear_model/linear_model/trip_start_hour_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
|
:linear/linear_model/linear_model/trip_start_hour_xf/zero/xConst*
dtype0*
_output_shapes
: *
value	B : 
М
8linear/linear_model/linear_model/trip_start_hour_xf/zeroCast:linear/linear_model/linear_model/trip_start_hour_xf/zero/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
є
8linear/linear_model/linear_model/trip_start_hour_xf/LessLessJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values8linear/linear_model/linear_model/trip_start_hour_xf/zero*
T0	*#
_output_shapes
:џџџџџџџџџ

@linear/linear_model/linear_model/trip_start_hour_xf/GreaterEqualGreaterEqualJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values?linear/linear_model/linear_model/trip_start_hour_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ю
@linear/linear_model/linear_model/trip_start_hour_xf/out_of_range	LogicalOr8linear/linear_model/linear_model/trip_start_hour_xf/Less@linear/linear_model/linear_model/trip_start_hour_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
У
9linear/linear_model/linear_model/trip_start_hour_xf/ShapeShapeJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

=linear/linear_model/linear_model/trip_start_hour_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Т
;linear/linear_model/linear_model/trip_start_hour_xf/ToInt64Cast=linear/linear_model/linear_model/trip_start_hour_xf/ToInt64/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Blinear/linear_model/linear_model/trip_start_hour_xf/default_valuesFill9linear/linear_model/linear_model/trip_start_hour_xf/Shape;linear/linear_model/linear_model/trip_start_hour_xf/ToInt64*
T0	*

index_type0*#
_output_shapes
:џџџџџџџџџ
Ф
:linear/linear_model/linear_model/trip_start_hour_xf/SelectSelect@linear/linear_model/linear_model/trip_start_hour_xf/out_of_rangeBlinear/linear_model/linear_model/trip_start_hour_xf/default_valuesJlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
н
@linear/linear_model/linear_model/trip_start_hour_xf/Shape_1/CastCastOlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Glinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

Alinear/linear_model/linear_model/trip_start_hour_xf/strided_sliceStridedSlice@linear/linear_model/linear_model/trip_start_hour_xf/Shape_1/CastGlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stackIlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_1Ilinear/linear_model/linear_model/trip_start_hour_xf/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 

<linear/linear_model/linear_model/trip_start_hour_xf/Cast/x/1Const*
dtype0*
_output_shapes
: *
valueB :
џџџџџџџџџ
§
:linear/linear_model/linear_model/trip_start_hour_xf/Cast/xPackAlinear/linear_model/linear_model/trip_start_hour_xf/strided_slice<linear/linear_model/linear_model/trip_start_hour_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Р
8linear/linear_model/linear_model/trip_start_hour_xf/CastCast:linear/linear_model/linear_model/trip_start_hour_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
й
Alinear/linear_model/linear_model/trip_start_hour_xf/SparseReshapeSparseReshapeKlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/indicesOlinear/linear_model/linear_model/trip_start_hour_xf/to_sparse_input/dense_shape8linear/linear_model/linear_model/trip_start_hour_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Р
Jlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape/IdentityIdentity:linear/linear_model/linear_model/trip_start_hour_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
И
Blinear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:

Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
с
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SliceSliceClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/beginKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice/size*
_output_shapes
:*
T0	*
Index0

Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Elinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ProdProdFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SliceFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	

Qlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2GatherV2Clinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Qlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/indicesNlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0

Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast/xPackElinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ProdIlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
п
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshapeSparseReshapeAlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshapeClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
н
Wlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityIdentityJlinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Olinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Е
Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqualGreaterEqualWlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityOlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
а
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/WhereWhereMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ё
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ї
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapeReshapeFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/WhereNlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1GatherV2Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshapeHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2GatherV2Wlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape/IdentityHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ReshapePlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0
Ь
Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/IdentityIdentityPlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

Zlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 

hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_1Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/GatherV2_2Ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/IdentityZlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ
Н
llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
П
nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
Э
flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicehlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsllinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stacknlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ

]linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/CastCastflinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ
Ё
_linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/UniqueUniquejlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *U
_classK
IGloc:@linear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp
Ж
ilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Blinear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp_linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Uniquenlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0*U
_classK
IGloc:@linear/linear_model/linear_model/trip_start_hour_xf/ReadVariableOp

rlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityilinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:џџџџџџџџџ*
T0
р
Xlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumrlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityalinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Unique:1]linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:џџџџџџџџџ
Ё
Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
г
Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1Reshapejlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Plinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
о
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ShapeShapeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Tlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
 
Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
О
Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_sliceStridedSliceFlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/ShapeTlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stackVlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_1Vlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
Ђ
Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stackPackHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack/0Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/strided_slice*
T0*

axis *
N*
_output_shapes
:
Ў
Elinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/TileTileJlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_1Flinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/stack*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ*

Tmultiples0
ф
Klinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/zeros_like	ZerosLikeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
ъ
@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sumSelectElinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/TileKlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/zeros_likeXlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
и
Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast_1CastClinear/linear_model/linear_model/trip_start_hour_xf/SparseReshape:1*
Truncate( *

DstT0*
_output_shapes
:*

SrcT0	

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 

Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ы
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1SliceGlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Cast_1Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/beginMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1/size*
_output_shapes
:*
T0*
Index0
Ш
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Shape_1Shape@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sum*
T0*
out_type0*
_output_shapes
:

Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
 
Mlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
ь
Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2SliceHlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Shape_1Nlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/beginMlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:

Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
я
Glinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concatConcatV2Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_1Hlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Slice_2Llinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
 
Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_2Reshape@linear/linear_model/linear_model/trip_start_hour_xf/weighted_sumGlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ш
Hlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zerosConst*
valueB*    *I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:
Є
6linear/linear_model/trip_start_month_xf/weights/part_0VarHandleOp*
dtype0*
_output_shapes
: *G
shared_name86linear/linear_model/trip_start_month_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
	container *
shape
:
Н
Wlinear/linear_model/trip_start_month_xf/weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 
Ћ
=linear/linear_model/trip_start_month_xf/weights/part_0/AssignAssignVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0Hlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zeros*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0

Jlinear/linear_model/trip_start_month_xf/weights/part_0/Read/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*I
_class?
=;loc:@linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:

Clinear/linear_model/linear_model/trip_start_month_xf/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ђ
?linear/linear_model/linear_model/trip_start_month_xf/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:16Clinear/linear_model/linear_model/trip_start_month_xf/ExpandDims/dim*

Tdim0*
T0	*
_output_shapes

:(

Slinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value/xConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
ю
Qlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_valueCastSlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0

Mlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/NotEqualNotEqual?linear/linear_model/linear_model/trip_start_month_xf/ExpandDimsQlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/ignore_value*
T0	*
_output_shapes

:(
ж
Llinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indicesWhereMlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:џџџџџџџџџ
Њ
Klinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/valuesGatherNd?linear/linear_model/linear_model/trip_start_month_xf/ExpandDimsLlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:џџџџџџџџџ
Љ
Plinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shapeConst*
dtype0	*
_output_shapes
:*%
valueB	"(              

Blinear/linear_model/linear_model/trip_start_month_xf/num_buckets/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ь
@linear/linear_model/linear_model/trip_start_month_xf/num_bucketsCastBlinear/linear_model/linear_model/trip_start_month_xf/num_buckets/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
}
;linear/linear_model/linear_model/trip_start_month_xf/zero/xConst*
value	B : *
dtype0*
_output_shapes
: 
О
9linear/linear_model/linear_model/trip_start_month_xf/zeroCast;linear/linear_model/linear_model/trip_start_month_xf/zero/x*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
ї
9linear/linear_model/linear_model/trip_start_month_xf/LessLessKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values9linear/linear_model/linear_model/trip_start_month_xf/zero*#
_output_shapes
:џџџџџџџџџ*
T0	

Alinear/linear_model/linear_model/trip_start_month_xf/GreaterEqualGreaterEqualKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values@linear/linear_model/linear_model/trip_start_month_xf/num_buckets*
T0	*#
_output_shapes
:џџџџџџџџџ
ё
Alinear/linear_model/linear_model/trip_start_month_xf/out_of_range	LogicalOr9linear/linear_model/linear_model/trip_start_month_xf/LessAlinear/linear_model/linear_model/trip_start_month_xf/GreaterEqual*#
_output_shapes
:џџџџџџџџџ
Х
:linear/linear_model/linear_model/trip_start_month_xf/ShapeShapeKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values*
T0	*
out_type0*
_output_shapes
:

>linear/linear_model/linear_model/trip_start_month_xf/ToInt64/xConst*
dtype0*
_output_shapes
: *
value	B : 
Ф
<linear/linear_model/linear_model/trip_start_month_xf/ToInt64Cast>linear/linear_model/linear_model/trip_start_month_xf/ToInt64/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 

Clinear/linear_model/linear_model/trip_start_month_xf/default_valuesFill:linear/linear_model/linear_model/trip_start_month_xf/Shape<linear/linear_model/linear_model/trip_start_month_xf/ToInt64*#
_output_shapes
:џџџџџџџџџ*
T0	*

index_type0
Ш
;linear/linear_model/linear_model/trip_start_month_xf/SelectSelectAlinear/linear_model/linear_model/trip_start_month_xf/out_of_rangeClinear/linear_model/linear_model/trip_start_month_xf/default_valuesKlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/values*
T0	*#
_output_shapes
:џџџџџџџџџ
п
Alinear/linear_model/linear_model/trip_start_month_xf/Shape_1/CastCastPlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:

Hlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 

Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

Blinear/linear_model/linear_model/trip_start_month_xf/strided_sliceStridedSliceAlinear/linear_model/linear_model/trip_start_month_xf/Shape_1/CastHlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stackJlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_1Jlinear/linear_model/linear_model/trip_start_month_xf/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 

=linear/linear_model/linear_model/trip_start_month_xf/Cast/x/1Const*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 

;linear/linear_model/linear_model/trip_start_month_xf/Cast/xPackBlinear/linear_model/linear_model/trip_start_month_xf/strided_slice=linear/linear_model/linear_model/trip_start_month_xf/Cast/x/1*
T0*

axis *
N*
_output_shapes
:
Т
9linear/linear_model/linear_model/trip_start_month_xf/CastCast;linear/linear_model/linear_model/trip_start_month_xf/Cast/x*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
н
Blinear/linear_model/linear_model/trip_start_month_xf/SparseReshapeSparseReshapeLlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/indicesPlinear/linear_model/linear_model/trip_start_month_xf/to_sparse_input/dense_shape9linear/linear_model/linear_model/trip_start_month_xf/Cast*-
_output_shapes
:џџџџџџџџџ:
Т
Klinear/linear_model/linear_model/trip_start_month_xf/SparseReshape/IdentityIdentity;linear/linear_model/linear_model/trip_start_month_xf/Select*
T0	*#
_output_shapes
:џџџџџџџџџ
К
Clinear/linear_model/linear_model/trip_start_month_xf/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:

Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:

Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
х
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SliceSliceDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/beginLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice/size*
_output_shapes
:*
T0	*
Index0

Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:

Flinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ProdProdGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SliceGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Const*

Tidx0*
	keep_dims( *
T0	*
_output_shapes
: 

Rlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 

Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2GatherV2Dlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Rlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/indicesOlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0

Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast/xPackFlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ProdJlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2*
T0	*

axis *
N*
_output_shapes
:
у
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshapeSparseReshapeBlinear/linear_model/linear_model/trip_start_month_xf/SparseReshapeDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast/x*-
_output_shapes
:џџџџџџџџџ:
п
Xlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityIdentityKlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape/Identity*
T0	*#
_output_shapes
:џџџџџџџџџ

Plinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
И
Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqualGreaterEqualXlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityPlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:џџџџџџџџџ
в
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/WhereWhereNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GreaterEqual*'
_output_shapes
:џџџџџџџџџ*
T0

Ђ
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
Њ
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeReshapeGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/WhereOlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1GatherV2Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshapeIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:џџџџџџџџџ

Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2GatherV2Xlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape/IdentityIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ReshapeQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	
Ю
Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/IdentityIdentityQlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseReshape:1*
_output_shapes
:*
T0	

[linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
Є
ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_1Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/GatherV2_2Jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Identity[linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/Const*T
_output_shapesB
@:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ*
T0	
О
mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
Р
olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
в
glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsmlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stackolinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:џџџџџџџџџ*
T0	*
Index0

^linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/CastCastglinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:џџџџџџџџџ
Ѓ
`linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/UniqueUniqueklinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ

olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *V
_classL
JHloc:@linear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp*
dtype0*
_output_shapes
: 
Л
jlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookupGatherV2Clinear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp`linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Uniqueolinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*V
_classL
JHloc:@linear/linear_model/linear_model/trip_start_month_xf/ReadVariableOp*'
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	

slinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/IdentityIdentityjlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:џџџџџџџџџ*
T0
ф
Ylinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparseSparseSegmentSumslinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/embedding_lookup/Identityblinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Unique:1^linear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse/Cast*'
_output_shapes
:џџџџџџџџџ*

Tidx0*
T0
Ђ
Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
ж
Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1Reshapeklinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2Qlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:џџџџџџџџџ
р
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ShapeShapeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:

Ulinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ё
Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
У
Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_sliceStridedSliceGlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/ShapeUlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stackWlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_1Wlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask

Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
Ѕ
Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stackPackIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack/0Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/strided_slice*
N*
_output_shapes
:*
T0*

axis 
Б
Flinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/TileTileKlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_1Glinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/stack*

Tmultiples0*
T0
*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
ц
Llinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/zeros_like	ZerosLikeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:џџџџџџџџџ
ю
Alinear/linear_model/linear_model/trip_start_month_xf/weighted_sumSelectFlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/TileLlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/zeros_likeYlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/embedding_lookup_sparse*'
_output_shapes
:џџџџџџџџџ*
T0
к
Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast_1CastDlinear/linear_model/linear_model/trip_start_month_xf/SparseReshape:1*
Truncate( *

DstT0*
_output_shapes
:*

SrcT0	

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
я
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1SliceHlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Cast_1Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/beginNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ъ
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Shape_1ShapeAlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum*
_output_shapes
:*
T0*
out_type0

Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
Ё
Nlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/sizeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
№
Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2SliceIlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Shape_1Olinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/beginNlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:

Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
ѓ
Hlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concatConcatV2Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_1Ilinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Slice_2Mlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
Ѓ
Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_2ReshapeAlinear/linear_model/linear_model/trip_start_month_xf/weighted_sumHlinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ

5linear/linear_model/linear_model/weighted_sum_no_biasAddNBlinear/linear_model/linear_model/company_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/dropoff_latitude_xf/weighted_sum/Reshape_2Llinear/linear_model/linear_model/dropoff_longitude_xf/weighted_sum/Reshape_2Glinear/linear_model/linear_model/payment_type_xf/weighted_sum/Reshape_2Jlinear/linear_model/linear_model/pickup_latitude_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/pickup_longitude_xf/weighted_sum/Reshape_2Ilinear/linear_model/linear_model/trip_start_day_xf/weighted_sum/Reshape_2Jlinear/linear_model/linear_model/trip_start_hour_xf/weighted_sum/Reshape_2Klinear/linear_model/linear_model/trip_start_month_xf/weighted_sum/Reshape_2*
T0*
N	*'
_output_shapes
:џџџџџџџџџ
Т
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
valueB*    *:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:
ѓ
'linear/linear_model/bias_weights/part_0VarHandleOp*8
shared_name)'linear/linear_model/bias_weights/part_0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 

Hlinear/linear_model/bias_weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 
я
.linear/linear_model/bias_weights/part_0/AssignAssignVariableOp'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
dtype0
л
;linear/linear_model/bias_weights/part_0/Read/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0

/linear/linear_model/bias_weights/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity/linear/linear_model/bias_weights/ReadVariableOp*
T0*
_output_shapes
:
к
-linear/linear_model/linear_model/weighted_sumBiasAdd5linear/linear_model/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
data_formatNHWC*'
_output_shapes
:џџџџџџџџџ*
T0
y
linear/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:
d
linear/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
f
linear/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
f
linear/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Ѕ
linear/strided_sliceStridedSlicelinear/ReadVariableOplinear/strided_slice/stacklinear/strided_slice/stack_1linear/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
\
linear/bias/tagsConst*
valueB Blinear/bias*
dtype0*
_output_shapes
: 
e
linear/biasScalarSummarylinear/bias/tagslinear/strided_slice*
T0*
_output_shapes
: 

linear/Reshape/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:
g
linear/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/ReshapeReshapelinear/Reshape/ReadVariableOplinear/Reshape/shape*
T0*
Tshape0*
_output_shapes
:

linear/Reshape_1/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/Reshape_1Reshapelinear/Reshape_1/ReadVariableOplinear/Reshape_1/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_2/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
i
linear/Reshape_2/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_2Reshapelinear/Reshape_2/ReadVariableOplinear/Reshape_2/shape*
T0*
Tshape0*
_output_shapes	
:ђ

linear/Reshape_3/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:
i
linear/Reshape_3/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_3Reshapelinear/Reshape_3/ReadVariableOplinear/Reshape_3/shape*
T0*
Tshape0*
_output_shapes
:

linear/Reshape_4/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
i
linear/Reshape_4/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_4Reshapelinear/Reshape_4/ReadVariableOplinear/Reshape_4/shape*
_output_shapes	
:ђ*
T0*
Tshape0

linear/Reshape_5/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_5/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_5Reshapelinear/Reshape_5/ReadVariableOplinear/Reshape_5/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_6/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:
i
linear/Reshape_6/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_6Reshapelinear/Reshape_6/ReadVariableOplinear/Reshape_6/shape*
T0*
Tshape0*
_output_shapes
:

linear/Reshape_7/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_7/shapeConst*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ

linear/Reshape_7Reshapelinear/Reshape_7/ReadVariableOplinear/Reshape_7/shape*
T0*
Tshape0*
_output_shapes
:


linear/Reshape_8/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

i
linear/Reshape_8/shapeConst*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:

linear/Reshape_8Reshapelinear/Reshape_8/ReadVariableOplinear/Reshape_8/shape*
T0*
Tshape0*
_output_shapes
:

T
linear/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 

linear/concatConcatV2linear/Reshapelinear/Reshape_1linear/Reshape_2linear/Reshape_3linear/Reshape_4linear/Reshape_5linear/Reshape_6linear/Reshape_7linear/Reshape_8linear/concat/axis*
N	*
_output_shapes	
:Я*

Tidx0*
T0
^
linear/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
s
linear/zero_fraction/EqualEquallinear/concatlinear/zero_fraction/zero*
T0*
_output_shapes	
:Я

linear/zero_fraction/CastCastlinear/zero_fraction/Equal*
Truncate( *

DstT0*
_output_shapes	
:Я*

SrcT0

d
linear/zero_fraction/ConstConst*
valueB: *
dtype0*
_output_shapes
:

linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

$linear/fraction_of_zero_weights/tagsConst*0
value'B% Blinear/fraction_of_zero_weights*
dtype0*
_output_shapes
: 

linear/fraction_of_zero_weightsScalarSummary$linear/fraction_of_zero_weights/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
`
linear/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ѓ
linear/zero_fraction_1/EqualEqual-linear/linear_model/linear_model/weighted_sumlinear/zero_fraction_1/zero*
T0*'
_output_shapes
:џџџџџџџџџ

linear/zero_fraction_1/CastCastlinear/zero_fraction_1/Equal*

SrcT0
*
Truncate( *

DstT0*'
_output_shapes
:џџџџџџџџџ
m
linear/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

linear/zero_fraction_1/MeanMeanlinear/zero_fraction_1/Castlinear/zero_fraction_1/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

*linear/linear/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *6
value-B+ B%linear/linear/fraction_of_zero_values
 
%linear/linear/fraction_of_zero_valuesScalarSummary*linear/linear/fraction_of_zero_values/tagslinear/zero_fraction_1/Mean*
_output_shapes
: *
T0
u
linear/linear/activation/tagConst*)
value B Blinear/linear/activation*
dtype0*
_output_shapes
: 

linear/linear/activationHistogramSummarylinear/linear/activation/tag-linear/linear_model/linear_model/weighted_sum*
T0*
_output_shapes
: 
v
addAdddnn/logits/BiasAdd-linear/linear_model/linear_model/weighted_sum*
T0*
_output_shapes

:(
n
head/predictions/logits/ShapeConst*
dtype0*
_output_shapes
:*
valueB"(      
s
1head/predictions/logits/assert_rank_at_least/rankConst*
dtype0*
_output_shapes
: *
value	B :
c
[head/predictions/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
T
Lhead/predictions/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
R
head/predictions/logisticSigmoidadd*
T0*
_output_shapes

:(
p
head/predictions/zeros_likeConst*
valueB(*    *
dtype0*
_output_shapes

:(
q
&head/predictions/two_class_logits/axisConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
Е
!head/predictions/two_class_logitsConcatV2head/predictions/zeros_likeadd&head/predictions/two_class_logits/axis*
T0*
N*
_output_shapes

:(*

Tidx0
u
head/predictions/probabilitiesSoftmax!head/predictions/two_class_logits*
T0*
_output_shapes

:(
o
$head/predictions/class_ids/dimensionConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
Б
head/predictions/class_idsArgMax!head/predictions/two_class_logits$head/predictions/class_ids/dimension*
T0*
output_type0	*
_output_shapes
:(*

Tidx0
j
head/predictions/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 

head/predictions/ExpandDims
ExpandDimshead/predictions/class_idshead/predictions/ExpandDims/dim*
T0	*
_output_shapes

:(*

Tdim0
Ь
head/predictions/str_classesAsStringhead/predictions/ExpandDims*

fill *

scientific( *
widthџџџџџџџџџ*
_output_shapes

:(*
shortest( *
	precisionџџџџџџџџџ*
T0	
e
head/labels/ExpandDims/dimConst*
valueB :
џџџџџџџџџ*
dtype0*
_output_shapes
: 
 
head/labels/ExpandDims
ExpandDims)read_batch_features/fifo_queue_Dequeue:11head/labels/ExpandDims/dim*
T0	*
_output_shapes

:(*

Tdim0
b
head/labels/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:
d
head/labels/Shape_1Const*
valueB"(      *
dtype0*
_output_shapes
:
g
%head/labels/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
w
&head/labels/assert_rank_at_least/ShapeConst*
valueB"(      *
dtype0*
_output_shapes
:
W
Ohead/labels/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/labels/assert_rank_at_least/static_checks_determined_all_okNoOp
Ќ
head/labels/strided_slice/stackConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
З
!head/labels/strided_slice/stack_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:
џџџџџџџџџ*
dtype0*
_output_shapes
:
Ў
!head/labels/strided_slice/stack_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
Л
head/labels/strided_sliceStridedSlicehead/labels/Shape_1head/labels/strided_slice/stack!head/labels/strided_slice/stack_1!head/labels/strided_slice/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0
Ј
head/labels/concat/values_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
:*
valueB:

head/labels/concat/axisConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
value	B : *
dtype0*
_output_shapes
: 
Љ
head/labels/concatConcatV2head/labels/strided_slicehead/labels/concat/values_1head/labels/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
s
head/labels/assert_equal/EqualEqualhead/labels/concathead/labels/Shape*
_output_shapes
:*
T0
Ћ
head/labels/assert_equal/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
:*
valueB: 

head/labels/assert_equal/AllAllhead/labels/assert_equal/Equalhead/labels/assert_equal/Const*

Tidx0*
	keep_dims( *
_output_shapes
: 
Р
%head/labels/assert_equal/Assert/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*(
valueB Bexpected_labels_shape: *
dtype0*
_output_shapes
: 
Й
'head/labels/assert_equal/Assert/Const_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
Ш
-head/labels/assert_equal/Assert/Assert/data_0ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*(
valueB Bexpected_labels_shape: *
dtype0*
_output_shapes
: 
П
-head/labels/assert_equal/Assert/Assert/data_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
ѓ
&head/labels/assert_equal/Assert/AssertAsserthead/labels/assert_equal/All-head/labels/assert_equal/Assert/Assert/data_0head/labels/concat-head/labels/assert_equal/Assert/Assert/data_2head/labels/Shape*
T
2*
	summarize
Ф
head/labelsIdentityhead/labels/ExpandDims'^head/labels/assert_equal/Assert/AssertA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
T0	*
_output_shapes

:(
i
head/ToFloatCasthead/labels*

SrcT0	*
Truncate( *

DstT0*
_output_shapes

:(
\
head/assert_range/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

-head/assert_range/assert_less_equal/LessEqual	LessEqualhead/ToFloathead/assert_range/Const*
T0*
_output_shapes

:(
z
)head/assert_range/assert_less_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Н
'head/assert_range/assert_less_equal/AllAll-head/assert_range/assert_less_equal/LessEqual)head/assert_range/assert_less_equal/Const*

Tidx0*
	keep_dims( *
_output_shapes
: 

0head/assert_range/assert_less_equal/Assert/ConstConst*-
value$B" BLabels must <= n_classes - 1*
dtype0*
_output_shapes
: 
Г
2head/assert_range/assert_less_equal/Assert/Const_1Const*Q
valueHBF B@Condition x <= y did not hold element-wise:x (head/ToFloat:0) = *
dtype0*
_output_shapes
: 

2head/assert_range/assert_less_equal/Assert/Const_2Const*1
value(B& B y (head/assert_range/Const:0) = *
dtype0*
_output_shapes
: 
М
=head/assert_range/assert_less_equal/Assert/AssertGuard/SwitchSwitch'head/assert_range/assert_less_equal/All'head/assert_range/assert_less_equal/All*
T0
*
_output_shapes
: : 
­
?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_tIdentity?head/assert_range/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
Ћ
?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_fIdentity=head/assert_range/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 

>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_idIdentity'head/assert_range/assert_less_equal/All*
_output_shapes
: *
T0


;head/assert_range/assert_less_equal/Assert/AssertGuard/NoOpNoOp@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t
Щ
Ihead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependencyIdentity?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t<^head/assert_range/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*R
_classH
FDloc:@head/assert_range/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
у
Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_0Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *-
value$B" BLabels must <= n_classes - 1

Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_1Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*Q
valueHBF B@Condition x <= y did not hold element-wise:x (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
ч
Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_3Const@^head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*1
value(B& B y (head/assert_range/Const:0) = *
dtype0*
_output_shapes
: 

=head/assert_range/assert_less_equal/Assert/AssertGuard/AssertAssertDhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/SwitchDhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_0Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_1Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_3Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize

Dhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch'head/assert_range/assert_less_equal/All>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*:
_class0
.,loc:@head/assert_range/assert_less_equal/All*
_output_shapes
: : 
ђ
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/ToFloat>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
T0*
_class
loc:@head/ToFloat*(
_output_shapes
:(:(
ј
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switchhead/assert_range/Const>head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0**
_class 
loc:@head/assert_range/Const
Э
Khead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency_1Identity?head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f>^head/assert_range/assert_less_equal/Assert/AssertGuard/Assert*
T0
*R
_classH
FDloc:@head/assert_range/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 

<head/assert_range/assert_less_equal/Assert/AssertGuard/MergeMergeKhead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency_1Ihead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
p
+head/assert_range/assert_non_negative/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
В
Ahead/assert_range/assert_non_negative/assert_less_equal/LessEqual	LessEqual+head/assert_range/assert_non_negative/Consthead/ToFloat*
T0*
_output_shapes

:(

=head/assert_range/assert_non_negative/assert_less_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
љ
;head/assert_range/assert_non_negative/assert_less_equal/AllAllAhead/assert_range/assert_non_negative/assert_less_equal/LessEqual=head/assert_range/assert_non_negative/assert_less_equal/Const*
_output_shapes
: *

Tidx0*
	keep_dims( 

Dhead/assert_range/assert_non_negative/assert_less_equal/Assert/ConstConst*
dtype0*
_output_shapes
: *!
valueB BLabels must >= 0
В
Fhead/assert_range/assert_non_negative/assert_less_equal/Assert/Const_1Const*<
value3B1 B+Condition x >= 0 did not hold element-wise:*
dtype0*
_output_shapes
: 

Fhead/assert_range/assert_non_negative/assert_less_equal/Assert/Const_2Const*&
valueB Bx (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
ј
Qhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/SwitchSwitch;head/assert_range/assert_non_negative/assert_less_equal/All;head/assert_range/assert_non_negative/assert_less_equal/All*
_output_shapes
: : *
T0

е
Shead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_tIdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
г
Shead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_fIdentityQhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Switch*
_output_shapes
: *
T0

М
Rhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_idIdentity;head/assert_range/assert_non_negative/assert_less_equal/All*
T0
*
_output_shapes
: 
­
Ohead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/NoOpNoOpT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t

]head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependencyIdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_tP^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*f
_class\
ZXloc:@head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
џ
Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_0ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*!
valueB BLabels must >= 0*
dtype0*
_output_shapes
: 

Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_1ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*<
value3B1 B+Condition x >= 0 did not hold element-wise:*
dtype0*
_output_shapes
: 

Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_2ConstT^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*&
valueB Bx (head/ToFloat:0) = *
dtype0*
_output_shapes
: 
П
Qhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/AssertAssertXhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/SwitchXhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_0Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_1Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_2Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1*
T
2*
	summarize
ц
Xhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch;head/assert_range/assert_non_negative/assert_less_equal/AllRhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*N
_classD
B@loc:@head/assert_range/assert_non_negative/assert_less_equal/All*
_output_shapes
: : 

Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/ToFloatRhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id*
T0*
_class
loc:@head/ToFloat*(
_output_shapes
:(:(

_head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency_1IdentityShead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_fR^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert*
T0
*f
_class\
ZXloc:@head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
Х
Phead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/MergeMerge_head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency_1]head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
я
head/assert_range/IdentityIdentityhead/ToFloat=^head/assert_range/assert_less_equal/Assert/AssertGuard/MergeQ^head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Merge*
T0*
_output_shapes

:(
r
head/logistic_loss/zeros_likeConst*
valueB(*    *
dtype0*
_output_shapes

:(
|
head/logistic_loss/GreaterEqualGreaterEqualaddhead/logistic_loss/zeros_like*
T0*
_output_shapes

:(

head/logistic_loss/SelectSelecthead/logistic_loss/GreaterEqualaddhead/logistic_loss/zeros_like*
T0*
_output_shapes

:(
K
head/logistic_loss/NegNegadd*
T0*
_output_shapes

:(

head/logistic_loss/Select_1Selecthead/logistic_loss/GreaterEqualhead/logistic_loss/Negadd*
_output_shapes

:(*
T0
g
head/logistic_loss/mulMuladdhead/assert_range/Identity*
T0*
_output_shapes

:(
y
head/logistic_loss/subSubhead/logistic_loss/Selecthead/logistic_loss/mul*
_output_shapes

:(*
T0
c
head/logistic_loss/ExpExphead/logistic_loss/Select_1*
T0*
_output_shapes

:(
b
head/logistic_loss/Log1pLog1phead/logistic_loss/Exp*
T0*
_output_shapes

:(
t
head/logistic_lossAddhead/logistic_loss/subhead/logistic_loss/Log1p*
T0*
_output_shapes

:(
t
/head/weighted_loss/assert_broadcastable/weightsConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
x
5head/weighted_loss/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
v
4head/weighted_loss/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

4head/weighted_loss/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:
u
3head/weighted_loss/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
K
Chead/weighted_loss/assert_broadcastable/static_scalar_check_successNoOp
Ї
head/weighted_loss/ToFloat/xConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
x
head/weighted_loss/MulMulhead/logistic_losshead/weighted_loss/ToFloat/x*
T0*
_output_shapes

:(
Џ
head/weighted_loss/ConstConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB"       

head/weighted_loss/SumSumhead/weighted_loss/Mulhead/weighted_loss/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
q
,metrics/label/mean/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Gmetrics/label/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Fmetrics/label/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

Fmetrics/label/mean/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Emetrics/label/mean/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
]
Umetrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
н
4metrics/label/mean/broadcast_weights/ones_like/ShapeConstV^metrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB"(      
б
4metrics/label/mean/broadcast_weights/ones_like/ConstConstV^metrics/label/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
н
.metrics/label/mean/broadcast_weights/ones_likeFill4metrics/label/mean/broadcast_weights/ones_like/Shape4metrics/label/mean/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
В
$metrics/label/mean/broadcast_weightsMul,metrics/label/mean/broadcast_weights/weights.metrics/label/mean/broadcast_weights/ones_like*
T0*
_output_shapes

:(

*metrics/label/mean/total/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *+
_class!
loc:@metrics/label/mean/total
Љ
metrics/label/mean/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@metrics/label/mean/total*
	container *
shape: 
ц
metrics/label/mean/total/AssignAssignmetrics/label/mean/total*metrics/label/mean/total/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@metrics/label/mean/total

metrics/label/mean/total/readIdentitymetrics/label/mean/total*
_output_shapes
: *
T0*+
_class!
loc:@metrics/label/mean/total

*metrics/label/mean/count/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *+
_class!
loc:@metrics/label/mean/count
Љ
metrics/label/mean/count
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@metrics/label/mean/count
ц
metrics/label/mean/count/AssignAssignmetrics/label/mean/count*metrics/label/mean/count/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@metrics/label/mean/count*
validate_shape(*
_output_shapes
: 

metrics/label/mean/count/readIdentitymetrics/label/mean/count*
T0*+
_class!
loc:@metrics/label/mean/count*
_output_shapes
: 

metrics/label/mean/MulMulhead/assert_range/Identity$metrics/label/mean/broadcast_weights*
T0*
_output_shapes

:(
i
metrics/label/mean/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

metrics/label/mean/SumSum$metrics/label/mean/broadcast_weightsmetrics/label/mean/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
k
metrics/label/mean/Const_1Const*
dtype0*
_output_shapes
:*
valueB"       

metrics/label/mean/Sum_1Summetrics/label/mean/Mulmetrics/label/mean/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
О
metrics/label/mean/AssignAdd	AssignAddmetrics/label/mean/totalmetrics/label/mean/Sum_1*
use_locking( *
T0*+
_class!
loc:@metrics/label/mean/total*
_output_shapes
: 
з
metrics/label/mean/AssignAdd_1	AssignAddmetrics/label/mean/countmetrics/label/mean/Sum^metrics/label/mean/Mul*
use_locking( *
T0*+
_class!
loc:@metrics/label/mean/count*
_output_shapes
: 

metrics/label/mean/truedivRealDivmetrics/label/mean/total/readmetrics/label/mean/count/read*
T0*
_output_shapes
: 
b
metrics/label/mean/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/label/mean/GreaterGreatermetrics/label/mean/count/readmetrics/label/mean/zeros_like*
_output_shapes
: *
T0

metrics/label/mean/valueSelectmetrics/label/mean/Greatermetrics/label/mean/truedivmetrics/label/mean/zeros_like*
T0*
_output_shapes
: 

metrics/label/mean/truediv_1RealDivmetrics/label/mean/AssignAddmetrics/label/mean/AssignAdd_1*
T0*
_output_shapes
: 
d
metrics/label/mean/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/label/mean/Greater_1Greatermetrics/label/mean/AssignAdd_1metrics/label/mean/zeros_like_1*
_output_shapes
: *
T0
Є
metrics/label/mean/update_opSelectmetrics/label/mean/Greater_1metrics/label/mean/truediv_1metrics/label/mean/zeros_like_1*
T0*
_output_shapes
: 
 
,metrics/average_loss/total/Initializer/zerosConst*
valueB
 *    *-
_class#
!loc:@metrics/average_loss/total*
dtype0*
_output_shapes
: 
­
metrics/average_loss/total
VariableV2*
shared_name *-
_class#
!loc:@metrics/average_loss/total*
	container *
shape: *
dtype0*
_output_shapes
: 
ю
!metrics/average_loss/total/AssignAssignmetrics/average_loss/total,metrics/average_loss/total/Initializer/zeros*
T0*-
_class#
!loc:@metrics/average_loss/total*
validate_shape(*
_output_shapes
: *
use_locking(

metrics/average_loss/total/readIdentitymetrics/average_loss/total*
T0*-
_class#
!loc:@metrics/average_loss/total*
_output_shapes
: 
 
,metrics/average_loss/count/Initializer/zerosConst*
valueB
 *    *-
_class#
!loc:@metrics/average_loss/count*
dtype0*
_output_shapes
: 
­
metrics/average_loss/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *-
_class#
!loc:@metrics/average_loss/count*
	container *
shape: 
ю
!metrics/average_loss/count/AssignAssignmetrics/average_loss/count,metrics/average_loss/count/Initializer/zeros*
T0*-
_class#
!loc:@metrics/average_loss/count*
validate_shape(*
_output_shapes
: *
use_locking(

metrics/average_loss/count/readIdentitymetrics/average_loss/count*
_output_shapes
: *
T0*-
_class#
!loc:@metrics/average_loss/count
_
metrics/average_loss/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

Imetrics/average_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Hmetrics/average_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 

Hmetrics/average_loss/broadcast_weights/assert_broadcastable/values/shapeConst*
dtype0*
_output_shapes
:*
valueB"(      

Gmetrics/average_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
_
Wmetrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
с
6metrics/average_loss/broadcast_weights/ones_like/ShapeConstX^metrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
е
6metrics/average_loss/broadcast_weights/ones_like/ConstConstX^metrics/average_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?
у
0metrics/average_loss/broadcast_weights/ones_likeFill6metrics/average_loss/broadcast_weights/ones_like/Shape6metrics/average_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
Є
&metrics/average_loss/broadcast_weightsMulmetrics/average_loss/Const0metrics/average_loss/broadcast_weights/ones_like*
T0*
_output_shapes

:(

metrics/average_loss/MulMulhead/logistic_loss&metrics/average_loss/broadcast_weights*
T0*
_output_shapes

:(
m
metrics/average_loss/Const_1Const*
dtype0*
_output_shapes
:*
valueB"       
Ѓ
metrics/average_loss/SumSum&metrics/average_loss/broadcast_weightsmetrics/average_loss/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
m
metrics/average_loss/Const_2Const*
valueB"       *
dtype0*
_output_shapes
:

metrics/average_loss/Sum_1Summetrics/average_loss/Mulmetrics/average_loss/Const_2*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
Ц
metrics/average_loss/AssignAdd	AssignAddmetrics/average_loss/totalmetrics/average_loss/Sum_1*
use_locking( *
T0*-
_class#
!loc:@metrics/average_loss/total*
_output_shapes
: 
с
 metrics/average_loss/AssignAdd_1	AssignAddmetrics/average_loss/countmetrics/average_loss/Sum^metrics/average_loss/Mul*
use_locking( *
T0*-
_class#
!loc:@metrics/average_loss/count*
_output_shapes
: 

metrics/average_loss/truedivRealDivmetrics/average_loss/total/readmetrics/average_loss/count/read*
T0*
_output_shapes
: 
d
metrics/average_loss/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/average_loss/GreaterGreatermetrics/average_loss/count/readmetrics/average_loss/zeros_like*
_output_shapes
: *
T0
Ђ
metrics/average_loss/valueSelectmetrics/average_loss/Greatermetrics/average_loss/truedivmetrics/average_loss/zeros_like*
T0*
_output_shapes
: 

metrics/average_loss/truediv_1RealDivmetrics/average_loss/AssignAdd metrics/average_loss/AssignAdd_1*
T0*
_output_shapes
: 
f
!metrics/average_loss/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/average_loss/Greater_1Greater metrics/average_loss/AssignAdd_1!metrics/average_loss/zeros_like_1*
T0*
_output_shapes
: 
Ќ
metrics/average_loss/update_opSelectmetrics/average_loss/Greater_1metrics/average_loss/truediv_1!metrics/average_loss/zeros_like_1*
T0*
_output_shapes
: 
R
metrics/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
y
metrics/CastCasthead/predictions/ExpandDims*

SrcT0	*
Truncate( *

DstT0*
_output_shapes

:(
i
metrics/EqualEqualmetrics/Casthead/assert_range/Identity*
T0*
_output_shapes

:(
n
metrics/ToFloatCastmetrics/Equal*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(

(metrics/accuracy/total/Initializer/zerosConst*
valueB
 *    *)
_class
loc:@metrics/accuracy/total*
dtype0*
_output_shapes
: 
Ѕ
metrics/accuracy/total
VariableV2*
shared_name *)
_class
loc:@metrics/accuracy/total*
	container *
shape: *
dtype0*
_output_shapes
: 
о
metrics/accuracy/total/AssignAssignmetrics/accuracy/total(metrics/accuracy/total/Initializer/zeros*
T0*)
_class
loc:@metrics/accuracy/total*
validate_shape(*
_output_shapes
: *
use_locking(

metrics/accuracy/total/readIdentitymetrics/accuracy/total*
T0*)
_class
loc:@metrics/accuracy/total*
_output_shapes
: 

(metrics/accuracy/count/Initializer/zerosConst*
valueB
 *    *)
_class
loc:@metrics/accuracy/count*
dtype0*
_output_shapes
: 
Ѕ
metrics/accuracy/count
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *)
_class
loc:@metrics/accuracy/count
о
metrics/accuracy/count/AssignAssignmetrics/accuracy/count(metrics/accuracy/count/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@metrics/accuracy/count*
validate_shape(*
_output_shapes
: 

metrics/accuracy/count/readIdentitymetrics/accuracy/count*
T0*)
_class
loc:@metrics/accuracy/count*
_output_shapes
: 

Emetrics/accuracy/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Dmetrics/accuracy/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

Dmetrics/accuracy/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Cmetrics/accuracy/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
[
Smetrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
й
2metrics/accuracy/broadcast_weights/ones_like/ShapeConstT^metrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
Э
2metrics/accuracy/broadcast_weights/ones_like/ConstConstT^metrics/accuracy/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
з
,metrics/accuracy/broadcast_weights/ones_likeFill2metrics/accuracy/broadcast_weights/ones_like/Shape2metrics/accuracy/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(

"metrics/accuracy/broadcast_weightsMulmetrics/Const,metrics/accuracy/broadcast_weights/ones_like*
T0*
_output_shapes

:(
y
metrics/accuracy/MulMulmetrics/ToFloat"metrics/accuracy/broadcast_weights*
T0*
_output_shapes

:(
g
metrics/accuracy/ConstConst*
dtype0*
_output_shapes
:*
valueB"       

metrics/accuracy/SumSum"metrics/accuracy/broadcast_weightsmetrics/accuracy/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
i
metrics/accuracy/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:

metrics/accuracy/Sum_1Summetrics/accuracy/Mulmetrics/accuracy/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
Ж
metrics/accuracy/AssignAdd	AssignAddmetrics/accuracy/totalmetrics/accuracy/Sum_1*
use_locking( *
T0*)
_class
loc:@metrics/accuracy/total*
_output_shapes
: 
Э
metrics/accuracy/AssignAdd_1	AssignAddmetrics/accuracy/countmetrics/accuracy/Sum^metrics/accuracy/Mul*
T0*)
_class
loc:@metrics/accuracy/count*
_output_shapes
: *
use_locking( 
~
metrics/accuracy/truedivRealDivmetrics/accuracy/total/readmetrics/accuracy/count/read*
T0*
_output_shapes
: 
`
metrics/accuracy/zeros_likeConst*
dtype0*
_output_shapes
: *
valueB
 *    
~
metrics/accuracy/GreaterGreatermetrics/accuracy/count/readmetrics/accuracy/zeros_like*
T0*
_output_shapes
: 

metrics/accuracy/valueSelectmetrics/accuracy/Greatermetrics/accuracy/truedivmetrics/accuracy/zeros_like*
T0*
_output_shapes
: 

metrics/accuracy/truediv_1RealDivmetrics/accuracy/AssignAddmetrics/accuracy/AssignAdd_1*
T0*
_output_shapes
: 
b
metrics/accuracy/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/accuracy/Greater_1Greatermetrics/accuracy/AssignAdd_1metrics/accuracy/zeros_like_1*
T0*
_output_shapes
: 

metrics/accuracy/update_opSelectmetrics/accuracy/Greater_1metrics/accuracy/truediv_1metrics/accuracy/zeros_like_1*
_output_shapes
: *
T0

metrics/precision/CastCasthead/predictions/ExpandDims*

SrcT0	*
Truncate( *

DstT0
*
_output_shapes

:(

metrics/precision/Cast_1Casthead/assert_range/Identity*

SrcT0*
Truncate( *

DstT0
*
_output_shapes

:(
\
metrics/precision/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
j
(metrics/precision/true_positives/Equal/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 

&metrics/precision/true_positives/EqualEqualmetrics/precision/Cast_1(metrics/precision/true_positives/Equal/y*
T0
*
_output_shapes

:(
l
*metrics/precision/true_positives/Equal_1/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 

(metrics/precision/true_positives/Equal_1Equalmetrics/precision/Cast*metrics/precision/true_positives/Equal_1/y*
T0
*
_output_shapes

:(
Ћ
+metrics/precision/true_positives/LogicalAnd
LogicalAnd&metrics/precision/true_positives/Equal(metrics/precision/true_positives/Equal_1*
_output_shapes

:(
W
Ometrics/precision/true_positives/assert_type/statically_determined_correct_typeNoOp
И
8metrics/precision/true_positives/count/Initializer/zerosConst*
valueB
 *    *9
_class/
-+loc:@metrics/precision/true_positives/count*
dtype0*
_output_shapes
: 
Х
&metrics/precision/true_positives/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *9
_class/
-+loc:@metrics/precision/true_positives/count*
	container *
shape: 

-metrics/precision/true_positives/count/AssignAssign&metrics/precision/true_positives/count8metrics/precision/true_positives/count/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@metrics/precision/true_positives/count*
validate_shape(*
_output_shapes
: 
Л
+metrics/precision/true_positives/count/readIdentity&metrics/precision/true_positives/count*
_output_shapes
: *
T0*9
_class/
-+loc:@metrics/precision/true_positives/count
Ѕ
(metrics/precision/true_positives/ToFloatCast+metrics/precision/true_positives/LogicalAnd*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(
g
%metrics/precision/true_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
v
4metrics/precision/true_positives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
x
5metrics/precision/true_positives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
f
^metrics/precision/true_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
h
`metrics/precision/true_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
W
Ometrics/precision/true_positives/assert_rank_in/static_checks_determined_all_okNoOp
щ
$metrics/precision/true_positives/MulMul(metrics/precision/true_positives/ToFloatmetrics/precision/ConstP^metrics/precision/true_positives/assert_rank_in/static_checks_determined_all_ok*
_output_shapes

:(*
T0

)metrics/precision/true_positives/IdentityIdentity+metrics/precision/true_positives/count/read*
_output_shapes
: *
T0
w
&metrics/precision/true_positives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
З
$metrics/precision/true_positives/SumSum$metrics/precision/true_positives/Mul&metrics/precision/true_positives/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
є
*metrics/precision/true_positives/AssignAdd	AssignAdd&metrics/precision/true_positives/count$metrics/precision/true_positives/Sum*
use_locking( *
T0*9
_class/
-+loc:@metrics/precision/true_positives/count*
_output_shapes
: 
k
)metrics/precision/false_positives/Equal/yConst*
value	B
 Z *
dtype0
*
_output_shapes
: 

'metrics/precision/false_positives/EqualEqualmetrics/precision/Cast_1)metrics/precision/false_positives/Equal/y*
T0
*
_output_shapes

:(
m
+metrics/precision/false_positives/Equal_1/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 
 
)metrics/precision/false_positives/Equal_1Equalmetrics/precision/Cast+metrics/precision/false_positives/Equal_1/y*
T0
*
_output_shapes

:(
Ў
,metrics/precision/false_positives/LogicalAnd
LogicalAnd'metrics/precision/false_positives/Equal)metrics/precision/false_positives/Equal_1*
_output_shapes

:(
X
Pmetrics/precision/false_positives/assert_type/statically_determined_correct_typeNoOp
К
9metrics/precision/false_positives/count/Initializer/zerosConst*
valueB
 *    *:
_class0
.,loc:@metrics/precision/false_positives/count*
dtype0*
_output_shapes
: 
Ч
'metrics/precision/false_positives/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *:
_class0
.,loc:@metrics/precision/false_positives/count*
	container *
shape: 
Ђ
.metrics/precision/false_positives/count/AssignAssign'metrics/precision/false_positives/count9metrics/precision/false_positives/count/Initializer/zeros*
use_locking(*
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
validate_shape(*
_output_shapes
: 
О
,metrics/precision/false_positives/count/readIdentity'metrics/precision/false_positives/count*
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
_output_shapes
: 
Ї
)metrics/precision/false_positives/ToFloatCast,metrics/precision/false_positives/LogicalAnd*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(
h
&metrics/precision/false_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
w
5metrics/precision/false_positives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
y
6metrics/precision/false_positives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
g
_metrics/precision/false_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
i
ametrics/precision/false_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
X
Pmetrics/precision/false_positives/assert_rank_in/static_checks_determined_all_okNoOp
ь
%metrics/precision/false_positives/MulMul)metrics/precision/false_positives/ToFloatmetrics/precision/ConstQ^metrics/precision/false_positives/assert_rank_in/static_checks_determined_all_ok*
_output_shapes

:(*
T0

*metrics/precision/false_positives/IdentityIdentity,metrics/precision/false_positives/count/read*
T0*
_output_shapes
: 
x
'metrics/precision/false_positives/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
К
%metrics/precision/false_positives/SumSum%metrics/precision/false_positives/Mul'metrics/precision/false_positives/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
ј
+metrics/precision/false_positives/AssignAdd	AssignAdd'metrics/precision/false_positives/count%metrics/precision/false_positives/Sum*
use_locking( *
T0*:
_class0
.,loc:@metrics/precision/false_positives/count*
_output_shapes
: 

metrics/precision/addAdd)metrics/precision/true_positives/Identity*metrics/precision/false_positives/Identity*
T0*
_output_shapes
: 
`
metrics/precision/Greater/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
y
metrics/precision/GreaterGreatermetrics/precision/addmetrics/precision/Greater/y*
T0*
_output_shapes
: 

metrics/precision/add_1Add)metrics/precision/true_positives/Identity*metrics/precision/false_positives/Identity*
_output_shapes
: *
T0

metrics/precision/divRealDiv)metrics/precision/true_positives/Identitymetrics/precision/add_1*
T0*
_output_shapes
: 
^
metrics/precision/value/eConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/precision/valueSelectmetrics/precision/Greatermetrics/precision/divmetrics/precision/value/e*
T0*
_output_shapes
: 

metrics/precision/add_2Add*metrics/precision/true_positives/AssignAdd+metrics/precision/false_positives/AssignAdd*
T0*
_output_shapes
: 
b
metrics/precision/Greater_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/precision/Greater_1Greatermetrics/precision/add_2metrics/precision/Greater_1/y*
T0*
_output_shapes
: 

metrics/precision/add_3Add*metrics/precision/true_positives/AssignAdd+metrics/precision/false_positives/AssignAdd*
_output_shapes
: *
T0

metrics/precision/div_1RealDiv*metrics/precision/true_positives/AssignAddmetrics/precision/add_3*
T0*
_output_shapes
: 
b
metrics/precision/update_op/eConst*
valueB
 *    *
dtype0*
_output_shapes
: 

metrics/precision/update_opSelectmetrics/precision/Greater_1metrics/precision/div_1metrics/precision/update_op/e*
T0*
_output_shapes
: 

metrics/recall/CastCasthead/predictions/ExpandDims*

SrcT0	*
Truncate( *

DstT0
*
_output_shapes

:(

metrics/recall/Cast_1Casthead/assert_range/Identity*

SrcT0*
Truncate( *

DstT0
*
_output_shapes

:(
Y
metrics/recall/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
g
%metrics/recall/true_positives/Equal/yConst*
value	B
 Z*
dtype0
*
_output_shapes
: 

#metrics/recall/true_positives/EqualEqualmetrics/recall/Cast_1%metrics/recall/true_positives/Equal/y*
_output_shapes

:(*
T0

i
'metrics/recall/true_positives/Equal_1/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z

%metrics/recall/true_positives/Equal_1Equalmetrics/recall/Cast'metrics/recall/true_positives/Equal_1/y*
T0
*
_output_shapes

:(
Ђ
(metrics/recall/true_positives/LogicalAnd
LogicalAnd#metrics/recall/true_positives/Equal%metrics/recall/true_positives/Equal_1*
_output_shapes

:(
T
Lmetrics/recall/true_positives/assert_type/statically_determined_correct_typeNoOp
В
5metrics/recall/true_positives/count/Initializer/zerosConst*
valueB
 *    *6
_class,
*(loc:@metrics/recall/true_positives/count*
dtype0*
_output_shapes
: 
П
#metrics/recall/true_positives/count
VariableV2*6
_class,
*(loc:@metrics/recall/true_positives/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 

*metrics/recall/true_positives/count/AssignAssign#metrics/recall/true_positives/count5metrics/recall/true_positives/count/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@metrics/recall/true_positives/count*
validate_shape(*
_output_shapes
: 
В
(metrics/recall/true_positives/count/readIdentity#metrics/recall/true_positives/count*
T0*6
_class,
*(loc:@metrics/recall/true_positives/count*
_output_shapes
: 

%metrics/recall/true_positives/ToFloatCast(metrics/recall/true_positives/LogicalAnd*
Truncate( *

DstT0*
_output_shapes

:(*

SrcT0

d
"metrics/recall/true_positives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
s
1metrics/recall/true_positives/assert_rank_in/rankConst*
dtype0*
_output_shapes
: *
value	B : 
u
2metrics/recall/true_positives/assert_rank_in/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
c
[metrics/recall/true_positives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
e
]metrics/recall/true_positives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
T
Lmetrics/recall/true_positives/assert_rank_in/static_checks_determined_all_okNoOp
н
!metrics/recall/true_positives/MulMul%metrics/recall/true_positives/ToFloatmetrics/recall/ConstM^metrics/recall/true_positives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(
}
&metrics/recall/true_positives/IdentityIdentity(metrics/recall/true_positives/count/read*
T0*
_output_shapes
: 
t
#metrics/recall/true_positives/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Ў
!metrics/recall/true_positives/SumSum!metrics/recall/true_positives/Mul#metrics/recall/true_positives/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
ш
'metrics/recall/true_positives/AssignAdd	AssignAdd#metrics/recall/true_positives/count!metrics/recall/true_positives/Sum*
_output_shapes
: *
use_locking( *
T0*6
_class,
*(loc:@metrics/recall/true_positives/count
h
&metrics/recall/false_negatives/Equal/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z

$metrics/recall/false_negatives/EqualEqualmetrics/recall/Cast_1&metrics/recall/false_negatives/Equal/y*
T0
*
_output_shapes

:(
j
(metrics/recall/false_negatives/Equal_1/yConst*
dtype0
*
_output_shapes
: *
value	B
 Z 

&metrics/recall/false_negatives/Equal_1Equalmetrics/recall/Cast(metrics/recall/false_negatives/Equal_1/y*
T0
*
_output_shapes

:(
Ѕ
)metrics/recall/false_negatives/LogicalAnd
LogicalAnd$metrics/recall/false_negatives/Equal&metrics/recall/false_negatives/Equal_1*
_output_shapes

:(
U
Mmetrics/recall/false_negatives/assert_type/statically_determined_correct_typeNoOp
Д
6metrics/recall/false_negatives/count/Initializer/zerosConst*
valueB
 *    *7
_class-
+)loc:@metrics/recall/false_negatives/count*
dtype0*
_output_shapes
: 
С
$metrics/recall/false_negatives/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *7
_class-
+)loc:@metrics/recall/false_negatives/count*
	container *
shape: 

+metrics/recall/false_negatives/count/AssignAssign$metrics/recall/false_negatives/count6metrics/recall/false_negatives/count/Initializer/zeros*
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count*
validate_shape(*
_output_shapes
: *
use_locking(
Е
)metrics/recall/false_negatives/count/readIdentity$metrics/recall/false_negatives/count*
_output_shapes
: *
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count
Ё
&metrics/recall/false_negatives/ToFloatCast)metrics/recall/false_negatives/LogicalAnd*

SrcT0
*
Truncate( *

DstT0*
_output_shapes

:(
e
#metrics/recall/false_negatives/RankConst*
value	B :*
dtype0*
_output_shapes
: 
t
2metrics/recall/false_negatives/assert_rank_in/rankConst*
value	B : *
dtype0*
_output_shapes
: 
v
3metrics/recall/false_negatives/assert_rank_in/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
d
\metrics/recall/false_negatives/assert_rank_in/assert_type/statically_determined_correct_typeNoOp
f
^metrics/recall/false_negatives/assert_rank_in/assert_type_1/statically_determined_correct_typeNoOp
U
Mmetrics/recall/false_negatives/assert_rank_in/static_checks_determined_all_okNoOp
р
"metrics/recall/false_negatives/MulMul&metrics/recall/false_negatives/ToFloatmetrics/recall/ConstN^metrics/recall/false_negatives/assert_rank_in/static_checks_determined_all_ok*
T0*
_output_shapes

:(

'metrics/recall/false_negatives/IdentityIdentity)metrics/recall/false_negatives/count/read*
T0*
_output_shapes
: 
u
$metrics/recall/false_negatives/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
Б
"metrics/recall/false_negatives/SumSum"metrics/recall/false_negatives/Mul$metrics/recall/false_negatives/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
ь
(metrics/recall/false_negatives/AssignAdd	AssignAdd$metrics/recall/false_negatives/count"metrics/recall/false_negatives/Sum*
use_locking( *
T0*7
_class-
+)loc:@metrics/recall/false_negatives/count*
_output_shapes
: 

metrics/recall/addAdd&metrics/recall/true_positives/Identity'metrics/recall/false_negatives/Identity*
T0*
_output_shapes
: 
]
metrics/recall/Greater/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
p
metrics/recall/GreaterGreatermetrics/recall/addmetrics/recall/Greater/y*
T0*
_output_shapes
: 

metrics/recall/add_1Add&metrics/recall/true_positives/Identity'metrics/recall/false_negatives/Identity*
T0*
_output_shapes
: 
|
metrics/recall/divRealDiv&metrics/recall/true_positives/Identitymetrics/recall/add_1*
_output_shapes
: *
T0
[
metrics/recall/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/recall/valueSelectmetrics/recall/Greatermetrics/recall/divmetrics/recall/value/e*
T0*
_output_shapes
: 

metrics/recall/add_2Add'metrics/recall/true_positives/AssignAdd(metrics/recall/false_negatives/AssignAdd*
T0*
_output_shapes
: 
_
metrics/recall/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
v
metrics/recall/Greater_1Greatermetrics/recall/add_2metrics/recall/Greater_1/y*
_output_shapes
: *
T0

metrics/recall/add_3Add'metrics/recall/true_positives/AssignAdd(metrics/recall/false_negatives/AssignAdd*
T0*
_output_shapes
: 

metrics/recall/div_1RealDiv'metrics/recall/true_positives/AssignAddmetrics/recall/add_3*
T0*
_output_shapes
: 
_
metrics/recall/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/recall/update_opSelectmetrics/recall/Greater_1metrics/recall/div_1metrics/recall/update_op/e*
T0*
_output_shapes
: 
v
1metrics/prediction/mean/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Lmetrics/prediction/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Kmetrics/prediction/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

Kmetrics/prediction/mean/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Jmetrics/prediction/mean/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
b
Zmetrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ч
9metrics/prediction/mean/broadcast_weights/ones_like/ShapeConst[^metrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
л
9metrics/prediction/mean/broadcast_weights/ones_like/ConstConst[^metrics/prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ь
3metrics/prediction/mean/broadcast_weights/ones_likeFill9metrics/prediction/mean/broadcast_weights/ones_like/Shape9metrics/prediction/mean/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
С
)metrics/prediction/mean/broadcast_weightsMul1metrics/prediction/mean/broadcast_weights/weights3metrics/prediction/mean/broadcast_weights/ones_like*
_output_shapes

:(*
T0
І
/metrics/prediction/mean/total/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *0
_class&
$"loc:@metrics/prediction/mean/total
Г
metrics/prediction/mean/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@metrics/prediction/mean/total*
	container *
shape: 
њ
$metrics/prediction/mean/total/AssignAssignmetrics/prediction/mean/total/metrics/prediction/mean/total/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@metrics/prediction/mean/total*
validate_shape(*
_output_shapes
: 
 
"metrics/prediction/mean/total/readIdentitymetrics/prediction/mean/total*
T0*0
_class&
$"loc:@metrics/prediction/mean/total*
_output_shapes
: 
І
/metrics/prediction/mean/count/Initializer/zerosConst*
valueB
 *    *0
_class&
$"loc:@metrics/prediction/mean/count*
dtype0*
_output_shapes
: 
Г
metrics/prediction/mean/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@metrics/prediction/mean/count*
	container *
shape: 
њ
$metrics/prediction/mean/count/AssignAssignmetrics/prediction/mean/count/metrics/prediction/mean/count/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
validate_shape(*
_output_shapes
: 
 
"metrics/prediction/mean/count/readIdentitymetrics/prediction/mean/count*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
_output_shapes
: 

metrics/prediction/mean/MulMulhead/predictions/logistic)metrics/prediction/mean/broadcast_weights*
T0*
_output_shapes

:(
n
metrics/prediction/mean/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
Њ
metrics/prediction/mean/SumSum)metrics/prediction/mean/broadcast_weightsmetrics/prediction/mean/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
p
metrics/prediction/mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
 
metrics/prediction/mean/Sum_1Summetrics/prediction/mean/Mulmetrics/prediction/mean/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
в
!metrics/prediction/mean/AssignAdd	AssignAddmetrics/prediction/mean/totalmetrics/prediction/mean/Sum_1*
_output_shapes
: *
use_locking( *
T0*0
_class&
$"loc:@metrics/prediction/mean/total
№
#metrics/prediction/mean/AssignAdd_1	AssignAddmetrics/prediction/mean/countmetrics/prediction/mean/Sum^metrics/prediction/mean/Mul*
T0*0
_class&
$"loc:@metrics/prediction/mean/count*
_output_shapes
: *
use_locking( 

metrics/prediction/mean/truedivRealDiv"metrics/prediction/mean/total/read"metrics/prediction/mean/count/read*
T0*
_output_shapes
: 
g
"metrics/prediction/mean/zeros_likeConst*
dtype0*
_output_shapes
: *
valueB
 *    

metrics/prediction/mean/GreaterGreater"metrics/prediction/mean/count/read"metrics/prediction/mean/zeros_like*
_output_shapes
: *
T0
Ў
metrics/prediction/mean/valueSelectmetrics/prediction/mean/Greatermetrics/prediction/mean/truediv"metrics/prediction/mean/zeros_like*
T0*
_output_shapes
: 

!metrics/prediction/mean/truediv_1RealDiv!metrics/prediction/mean/AssignAdd#metrics/prediction/mean/AssignAdd_1*
_output_shapes
: *
T0
i
$metrics/prediction/mean/zeros_like_1Const*
dtype0*
_output_shapes
: *
valueB
 *    

!metrics/prediction/mean/Greater_1Greater#metrics/prediction/mean/AssignAdd_1$metrics/prediction/mean/zeros_like_1*
T0*
_output_shapes
: 
И
!metrics/prediction/mean/update_opSelect!metrics/prediction/mean/Greater_1!metrics/prediction/mean/truediv_1$metrics/prediction/mean/zeros_like_1*
T0*
_output_shapes
: 
d
metrics/accuracy_baseline/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

metrics/accuracy_baseline/subSubmetrics/accuracy_baseline/sub/xmetrics/label/mean/value*
T0*
_output_shapes
: 

metrics/accuracy_baseline/valueMaximummetrics/label/mean/valuemetrics/accuracy_baseline/sub*
T0*
_output_shapes
: 
f
!metrics/accuracy_baseline/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

metrics/accuracy_baseline/sub_1Sub!metrics/accuracy_baseline/sub_1/xmetrics/label/mean/update_op*
T0*
_output_shapes
: 

#metrics/accuracy_baseline/update_opMaximummetrics/label/mean/update_opmetrics/accuracy_baseline/sub_1*
T0*
_output_shapes
: 
j
%metrics/auc/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

@metrics/auc/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

?metrics/auc/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 

?metrics/auc/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

>metrics/auc/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
V
Nmetrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
Я
-metrics/auc/broadcast_weights/ones_like/ShapeConstO^metrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB"(      
У
-metrics/auc/broadcast_weights/ones_like/ConstConstO^metrics/auc/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?
Ш
'metrics/auc/broadcast_weights/ones_likeFill-metrics/auc/broadcast_weights/ones_like/Shape-metrics/auc/broadcast_weights/ones_like/Const*
_output_shapes

:(*
T0*

index_type0

metrics/auc/broadcast_weightsMul%metrics/auc/broadcast_weights/weights'metrics/auc/broadcast_weights/ones_like*
_output_shapes

:(*
T0
W
metrics/auc/Cast/xConst*
dtype0*
_output_shapes
: *
valueB
 *    

-metrics/auc/assert_greater_equal/GreaterEqualGreaterEqualhead/predictions/logisticmetrics/auc/Cast/x*
_output_shapes

:(*
T0
w
&metrics/auc/assert_greater_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
З
$metrics/auc/assert_greater_equal/AllAll-metrics/auc/assert_greater_equal/GreaterEqual&metrics/auc/assert_greater_equal/Const*
_output_shapes
: *

Tidx0*
	keep_dims( 

-metrics/auc/assert_greater_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
Н
/metrics/auc/assert_greater_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = 

/metrics/auc/assert_greater_equal/Assert/Const_2Const*,
value#B! By (metrics/auc/Cast/x:0) = *
dtype0*
_output_shapes
: 
Г
:metrics/auc/assert_greater_equal/Assert/AssertGuard/SwitchSwitch$metrics/auc/assert_greater_equal/All$metrics/auc/assert_greater_equal/All*
_output_shapes
: : *
T0

Ї
<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_tIdentity<metrics/auc/assert_greater_equal/Assert/AssertGuard/Switch:1*
_output_shapes
: *
T0

Ѕ
<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_fIdentity:metrics/auc/assert_greater_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 

;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_idIdentity$metrics/auc/assert_greater_equal/All*
T0
*
_output_shapes
: 

8metrics/auc/assert_greater_equal/Assert/AssertGuard/NoOpNoOp=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t
Н
Fmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependencyIdentity<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t9^metrics/auc/assert_greater_equal/Assert/AssertGuard/NoOp*
_output_shapes
: *
T0
*O
_classE
CAloc:@metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t
о
Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_0Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]

Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_1Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 
м
Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_3Const=^metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*,
value#B! By (metrics/auc/Cast/x:0) = *
dtype0*
_output_shapes
: 
ћ
:metrics/auc/assert_greater_equal/Assert/AssertGuard/AssertAssertAmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/SwitchAmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_0Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_1Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_3Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize

Ametrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/SwitchSwitch$metrics/auc/assert_greater_equal/All;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0
*7
_class-
+)loc:@metrics/auc/assert_greater_equal/All*
_output_shapes
: : 

Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logistic;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
ш
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2Switchmetrics/auc/Cast/x;metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*%
_class
loc:@metrics/auc/Cast/x*
_output_shapes
: : 
С
Hmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency_1Identity<metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f;^metrics/auc/assert_greater_equal/Assert/AssertGuard/Assert*
T0
*O
_classE
CAloc:@metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 

9metrics/auc/assert_greater_equal/Assert/AssertGuard/MergeMergeHmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency_1Fmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
Y
metrics/auc/Cast_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

'metrics/auc/assert_less_equal/LessEqual	LessEqualhead/predictions/logisticmetrics/auc/Cast_1/x*
T0*
_output_shapes

:(
t
#metrics/auc/assert_less_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Ћ
!metrics/auc/assert_less_equal/AllAll'metrics/auc/assert_less_equal/LessEqual#metrics/auc/assert_less_equal/Const*
_output_shapes
: *

Tidx0*
	keep_dims( 

*metrics/auc/assert_less_equal/Assert/ConstConst*.
value%B# Bpredictions must be in [0, 1]*
dtype0*
_output_shapes
: 
К
,metrics/auc/assert_less_equal/Assert/Const_1Const*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

,metrics/auc/assert_less_equal/Assert/Const_2Const*.
value%B# By (metrics/auc/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
Њ
7metrics/auc/assert_less_equal/Assert/AssertGuard/SwitchSwitch!metrics/auc/assert_less_equal/All!metrics/auc/assert_less_equal/All*
T0
*
_output_shapes
: : 
Ё
9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_tIdentity9metrics/auc/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 

9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_fIdentity7metrics/auc/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 

8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_idIdentity!metrics/auc/assert_less_equal/All*
_output_shapes
: *
T0

y
5metrics/auc/assert_less_equal/Assert/AssertGuard/NoOpNoOp:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t
Б
Cmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependencyIdentity9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t6^metrics/auc/assert_less_equal/Assert/AssertGuard/NoOp*
T0
*L
_classB
@>loc:@metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t*
_output_shapes
: 
и
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_0Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]

>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_1Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 
и
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_3Const:^metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*.
value%B# By (metrics/auc/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
ц
7metrics/auc/assert_less_equal/Assert/AssertGuard/AssertAssert>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_0>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_1@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_3@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
ў
>metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch!metrics/auc/assert_less_equal/All8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
T0
*4
_class*
(&loc:@metrics/auc/assert_less_equal/All*
_output_shapes
: : 

@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logistic8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
ц
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switchmetrics/auc/Cast_1/x8metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0*'
_class
loc:@metrics/auc/Cast_1/x
Е
Emetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency_1Identity9metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f8^metrics/auc/assert_less_equal/Assert/AssertGuard/Assert*
T0
*L
_classB
@>loc:@metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
ї
6metrics/auc/assert_less_equal/Assert/AssertGuard/MergeMergeEmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency_1Cmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
ѓ
metrics/auc/Cast_2Casthead/assert_range/Identity:^metrics/auc/assert_greater_equal/Assert/AssertGuard/Merge7^metrics/auc/assert_less_equal/Assert/AssertGuard/Merge*

SrcT0*
Truncate( *

DstT0
*
_output_shapes

:(
j
metrics/auc/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"џџџџ   

metrics/auc/ReshapeReshapehead/predictions/logisticmetrics/auc/Reshape/shape*
_output_shapes

:(*
T0*
Tshape0
l
metrics/auc/Reshape_1/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:

metrics/auc/Reshape_1Reshapemetrics/auc/Cast_2metrics/auc/Reshape_1/shape*
_output_shapes

:(*
T0
*
Tshape0

metrics/auc/ConstConst*Й
valueЏBЌШ" ПжГЯЉЄ;ЯЉ$<Зўv<ЯЉЄ<CдЭ<Зўі<=ЯЉ$=	?9=CдM=}ib=Зўv=јЩ==2_=ЯЉЄ=lєЎ=	?Й=ІУ=CдЭ=ри=}iт=Дь=Зўі=ЊЄ >јЩ>Gя
>>ф9>2_>>ЯЉ$>Я)>lє.>Л4>	?9>Wd>>ІC>єЎH>CдM>љR>рX>.D]>}ib>Ыg>Дl>hйq>Зўv>$|>ЊЄ>Q7>јЩ> \>Gя>ю>><Ї>ф9>Ь>2_>йё>>(Ђ>ЯЉЄ>v<Ї>ЯЉ>ХaЌ>lєЎ>Б>ЛД>bЌЖ>	?Й>АбЛ>WdО>џіР>ІУ>MЦ>єЎШ>AЫ>CдЭ>ъfа>љв>9е>ри>Бк>.Dн>жжп>}iт>$ќф>Ыч>r!ъ>Дь>СFя>hйё>lє>Зўі>^љ>$ќ>ЌЖў>ЊЄ ?§э?Q7?Ѕ?јЩ?L? \?ѓЅ	?Gя
?8?ю?BЫ??щ]?<Ї?№?ф9?7?Ь?п?2_?Ј?йё?-;??дЭ ?("?{`#?ЯЉ$?#ѓ%?v<'?Ъ(?Я)?q+?Хa,?Ћ-?lє.?Р=0?1?gа2?Л4?c5?bЌ6?Еѕ7?	?9?]:?Аб;?=?Wd>?Ћ­??џі@?R@B?ІC?њвD?MF?ЁeG?єЎH?HјI?AK?яL?CдM?O?ъfP?>АQ?љR?хBT?9U?еV?рX?3hY?БZ?лњ[?.D]?^?жж_?) a?}ib?аВc?$ќd?xEf?Ыg?иh?r!j?Цjk?Дl?m§m?СFo?p?hйq?М"s?lt?cЕu?Зўv?
Hx?^y?Вкz?$|?Ym}?ЌЖ~? ?*
dtype0*
_output_shapes	
:Ш
d
metrics/auc/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:

metrics/auc/ExpandDims
ExpandDimsmetrics/auc/Constmetrics/auc/ExpandDims/dim*
_output_shapes
:	Ш*

Tdim0*
T0
b
metrics/auc/stackConst*
valueB"   (   *
dtype0*
_output_shapes
:

metrics/auc/TileTilemetrics/auc/ExpandDimsmetrics/auc/stack*
T0*
_output_shapes
:	Ш(*

Tmultiples0
X
metrics/auc/transpose/RankRankmetrics/auc/Reshape*
T0*
_output_shapes
: 
]
metrics/auc/transpose/sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
z
metrics/auc/transpose/subSubmetrics/auc/transpose/Rankmetrics/auc/transpose/sub/y*
_output_shapes
: *
T0
c
!metrics/auc/transpose/Range/startConst*
value	B : *
dtype0*
_output_shapes
: 
c
!metrics/auc/transpose/Range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
З
metrics/auc/transpose/RangeRange!metrics/auc/transpose/Range/startmetrics/auc/transpose/Rank!metrics/auc/transpose/Range/delta*#
_output_shapes
:џџџџџџџџџ*

Tidx0

metrics/auc/transpose/sub_1Submetrics/auc/transpose/submetrics/auc/transpose/Range*
T0*#
_output_shapes
:џџџџџџџџџ

metrics/auc/transpose	Transposemetrics/auc/Reshapemetrics/auc/transpose/sub_1*
T0*
_output_shapes

:(*
Tperm0
m
metrics/auc/Tile_1/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:

metrics/auc/Tile_1Tilemetrics/auc/transposemetrics/auc/Tile_1/multiples*

Tmultiples0*
T0*
_output_shapes
:	Ш(
n
metrics/auc/GreaterGreatermetrics/auc/Tile_1metrics/auc/Tile*
T0*
_output_shapes
:	Ш(
Z
metrics/auc/LogicalNot
LogicalNotmetrics/auc/Greater*
_output_shapes
:	Ш(
m
metrics/auc/Tile_2/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:

metrics/auc/Tile_2Tilemetrics/auc/Reshape_1metrics/auc/Tile_2/multiples*

Tmultiples0*
T0
*
_output_shapes
:	Ш(
[
metrics/auc/LogicalNot_1
LogicalNotmetrics/auc/Tile_2*
_output_shapes
:	Ш(
l
metrics/auc/Reshape_2/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:

metrics/auc/Reshape_2Reshapemetrics/auc/broadcast_weightsmetrics/auc/Reshape_2/shape*
T0*
Tshape0*
_output_shapes

:(
m
metrics/auc/Tile_3/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:

metrics/auc/Tile_3Tilemetrics/auc/Reshape_2metrics/auc/Tile_3/multiples*

Tmultiples0*
T0*
_output_shapes
:	Ш(
Њ
,metrics/auc/true_positives/Initializer/zerosConst*
valueBШ*    *-
_class#
!loc:@metrics/auc/true_positives*
dtype0*
_output_shapes	
:Ш
З
metrics/auc/true_positives
VariableV2*
shared_name *-
_class#
!loc:@metrics/auc/true_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
ѓ
!metrics/auc/true_positives/AssignAssignmetrics/auc/true_positives,metrics/auc/true_positives/Initializer/zeros*
validate_shape(*
_output_shapes	
:Ш*
use_locking(*
T0*-
_class#
!loc:@metrics/auc/true_positives

metrics/auc/true_positives/readIdentitymetrics/auc/true_positives*
T0*-
_class#
!loc:@metrics/auc/true_positives*
_output_shapes	
:Ш
n
metrics/auc/LogicalAnd
LogicalAndmetrics/auc/Tile_2metrics/auc/Greater*
_output_shapes
:	Ш(
|
metrics/auc/ToFloatCastmetrics/auc/LogicalAnd*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
i
metrics/auc/mulMulmetrics/auc/ToFloatmetrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
c
!metrics/auc/Sum/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/SumSummetrics/auc/mul!metrics/auc/Sum/reduction_indices*

Tidx0*
	keep_dims( *
T0*
_output_shapes	
:Ш
З
metrics/auc/AssignAdd	AssignAddmetrics/auc/true_positivesmetrics/auc/Sum*
_output_shapes	
:Ш*
use_locking( *
T0*-
_class#
!loc:@metrics/auc/true_positives
Ќ
-metrics/auc/false_negatives/Initializer/zerosConst*
valueBШ*    *.
_class$
" loc:@metrics/auc/false_negatives*
dtype0*
_output_shapes	
:Ш
Й
metrics/auc/false_negatives
VariableV2*
dtype0*
_output_shapes	
:Ш*
shared_name *.
_class$
" loc:@metrics/auc/false_negatives*
	container *
shape:Ш
ї
"metrics/auc/false_negatives/AssignAssignmetrics/auc/false_negatives-metrics/auc/false_negatives/Initializer/zeros*
use_locking(*
T0*.
_class$
" loc:@metrics/auc/false_negatives*
validate_shape(*
_output_shapes	
:Ш

 metrics/auc/false_negatives/readIdentitymetrics/auc/false_negatives*
T0*.
_class$
" loc:@metrics/auc/false_negatives*
_output_shapes	
:Ш
s
metrics/auc/LogicalAnd_1
LogicalAndmetrics/auc/Tile_2metrics/auc/LogicalNot*
_output_shapes
:	Ш(

metrics/auc/ToFloat_1Castmetrics/auc/LogicalAnd_1*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
m
metrics/auc/mul_1Mulmetrics/auc/ToFloat_1metrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
e
#metrics/auc/Sum_1/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_1Summetrics/auc/mul_1#metrics/auc/Sum_1/reduction_indices*
T0*
_output_shapes	
:Ш*

Tidx0*
	keep_dims( 
Н
metrics/auc/AssignAdd_1	AssignAddmetrics/auc/false_negativesmetrics/auc/Sum_1*
_output_shapes	
:Ш*
use_locking( *
T0*.
_class$
" loc:@metrics/auc/false_negatives
Њ
,metrics/auc/true_negatives/Initializer/zerosConst*
valueBШ*    *-
_class#
!loc:@metrics/auc/true_negatives*
dtype0*
_output_shapes	
:Ш
З
metrics/auc/true_negatives
VariableV2*
shared_name *-
_class#
!loc:@metrics/auc/true_negatives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
ѓ
!metrics/auc/true_negatives/AssignAssignmetrics/auc/true_negatives,metrics/auc/true_negatives/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
validate_shape(*
_output_shapes	
:Ш

metrics/auc/true_negatives/readIdentitymetrics/auc/true_negatives*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
_output_shapes	
:Ш
y
metrics/auc/LogicalAnd_2
LogicalAndmetrics/auc/LogicalNot_1metrics/auc/LogicalNot*
_output_shapes
:	Ш(

metrics/auc/ToFloat_2Castmetrics/auc/LogicalAnd_2*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
m
metrics/auc/mul_2Mulmetrics/auc/ToFloat_2metrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
e
#metrics/auc/Sum_2/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_2Summetrics/auc/mul_2#metrics/auc/Sum_2/reduction_indices*
T0*
_output_shapes	
:Ш*

Tidx0*
	keep_dims( 
Л
metrics/auc/AssignAdd_2	AssignAddmetrics/auc/true_negativesmetrics/auc/Sum_2*
T0*-
_class#
!loc:@metrics/auc/true_negatives*
_output_shapes	
:Ш*
use_locking( 
Ќ
-metrics/auc/false_positives/Initializer/zerosConst*
valueBШ*    *.
_class$
" loc:@metrics/auc/false_positives*
dtype0*
_output_shapes	
:Ш
Й
metrics/auc/false_positives
VariableV2*.
_class$
" loc:@metrics/auc/false_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш*
shared_name 
ї
"metrics/auc/false_positives/AssignAssignmetrics/auc/false_positives-metrics/auc/false_positives/Initializer/zeros*
use_locking(*
T0*.
_class$
" loc:@metrics/auc/false_positives*
validate_shape(*
_output_shapes	
:Ш

 metrics/auc/false_positives/readIdentitymetrics/auc/false_positives*
T0*.
_class$
" loc:@metrics/auc/false_positives*
_output_shapes	
:Ш
v
metrics/auc/LogicalAnd_3
LogicalAndmetrics/auc/LogicalNot_1metrics/auc/Greater*
_output_shapes
:	Ш(

metrics/auc/ToFloat_3Castmetrics/auc/LogicalAnd_3*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
m
metrics/auc/mul_3Mulmetrics/auc/ToFloat_3metrics/auc/Tile_3*
T0*
_output_shapes
:	Ш(
e
#metrics/auc/Sum_3/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 

metrics/auc/Sum_3Summetrics/auc/mul_3#metrics/auc/Sum_3/reduction_indices*
_output_shapes	
:Ш*

Tidx0*
	keep_dims( *
T0
Н
metrics/auc/AssignAdd_3	AssignAddmetrics/auc/false_positivesmetrics/auc/Sum_3*
use_locking( *
T0*.
_class$
" loc:@metrics/auc/false_positives*
_output_shapes	
:Ш
V
metrics/auc/add/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75
p
metrics/auc/addAddmetrics/auc/true_positives/readmetrics/auc/add/y*
T0*
_output_shapes	
:Ш

metrics/auc/add_1Addmetrics/auc/true_positives/read metrics/auc/false_negatives/read*
_output_shapes	
:Ш*
T0
X
metrics/auc/add_2/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
f
metrics/auc/add_2Addmetrics/auc/add_1metrics/auc/add_2/y*
T0*
_output_shapes	
:Ш
d
metrics/auc/divRealDivmetrics/auc/addmetrics/auc/add_2*
T0*
_output_shapes	
:Ш

metrics/auc/add_3Add metrics/auc/false_positives/readmetrics/auc/true_negatives/read*
T0*
_output_shapes	
:Ш
X
metrics/auc/add_4/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
f
metrics/auc/add_4Addmetrics/auc/add_3metrics/auc/add_4/y*
T0*
_output_shapes	
:Ш
w
metrics/auc/div_1RealDiv metrics/auc/false_positives/readmetrics/auc/add_4*
_output_shapes	
:Ш*
T0
i
metrics/auc/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
!metrics/auc/strided_slice/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
k
!metrics/auc/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
К
metrics/auc/strided_sliceStridedSlicemetrics/auc/div_1metrics/auc/strided_slice/stack!metrics/auc/strided_slice/stack_1!metrics/auc/strided_slice/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
m
#metrics/auc/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_1StridedSlicemetrics/auc/div_1!metrics/auc/strided_slice_1/stack#metrics/auc/strided_slice_1/stack_1#metrics/auc/strided_slice_1/stack_2*
end_mask*
_output_shapes	
:Ч*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask 
t
metrics/auc/subSubmetrics/auc/strided_slicemetrics/auc/strided_slice_1*
T0*
_output_shapes	
:Ч
k
!metrics/auc/strided_slice_2/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
#metrics/auc/strided_slice_2/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Р
metrics/auc/strided_slice_2StridedSlicemetrics/auc/div!metrics/auc/strided_slice_2/stack#metrics/auc/strided_slice_2/stack_1#metrics/auc/strided_slice_2/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
T0*
Index0*
shrink_axis_mask 
k
!metrics/auc/strided_slice_3/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_3/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_3/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Р
metrics/auc/strided_slice_3StridedSlicemetrics/auc/div!metrics/auc/strided_slice_3/stack#metrics/auc/strided_slice_3/stack_1#metrics/auc/strided_slice_3/stack_2*
end_mask*
_output_shapes	
:Ч*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask 
x
metrics/auc/add_5Addmetrics/auc/strided_slice_2metrics/auc/strided_slice_3*
T0*
_output_shapes	
:Ч
Z
metrics/auc/truediv/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
n
metrics/auc/truedivRealDivmetrics/auc/add_5metrics/auc/truediv/y*
T0*
_output_shapes	
:Ч
d
metrics/auc/Mul_4Mulmetrics/auc/submetrics/auc/truediv*
T0*
_output_shapes	
:Ч
]
metrics/auc/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
~
metrics/auc/valueSummetrics/auc/Mul_4metrics/auc/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
X
metrics/auc/add_6/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75
j
metrics/auc/add_6Addmetrics/auc/AssignAddmetrics/auc/add_6/y*
_output_shapes	
:Ш*
T0
n
metrics/auc/add_7Addmetrics/auc/AssignAddmetrics/auc/AssignAdd_1*
T0*
_output_shapes	
:Ш
X
metrics/auc/add_8/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75
f
metrics/auc/add_8Addmetrics/auc/add_7metrics/auc/add_8/y*
T0*
_output_shapes	
:Ш
h
metrics/auc/div_2RealDivmetrics/auc/add_6metrics/auc/add_8*
T0*
_output_shapes	
:Ш
p
metrics/auc/add_9Addmetrics/auc/AssignAdd_3metrics/auc/AssignAdd_2*
T0*
_output_shapes	
:Ш
Y
metrics/auc/add_10/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
h
metrics/auc/add_10Addmetrics/auc/add_9metrics/auc/add_10/y*
_output_shapes	
:Ш*
T0
o
metrics/auc/div_3RealDivmetrics/auc/AssignAdd_3metrics/auc/add_10*
T0*
_output_shapes	
:Ш
k
!metrics/auc/strided_slice_4/stackConst*
dtype0*
_output_shapes
:*
valueB: 
n
#metrics/auc/strided_slice_4/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_4StridedSlicemetrics/auc/div_3!metrics/auc/strided_slice_4/stack#metrics/auc/strided_slice_4/stack_1#metrics/auc/strided_slice_4/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_5/stackConst*
dtype0*
_output_shapes
:*
valueB:
m
#metrics/auc/strided_slice_5/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_5/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_5StridedSlicemetrics/auc/div_3!metrics/auc/strided_slice_5/stack#metrics/auc/strided_slice_5/stack_1#metrics/auc/strided_slice_5/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч
x
metrics/auc/sub_1Submetrics/auc/strided_slice_4metrics/auc/strided_slice_5*
T0*
_output_shapes	
:Ч
k
!metrics/auc/strided_slice_6/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
#metrics/auc/strided_slice_6/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_6/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Т
metrics/auc/strided_slice_6StridedSlicemetrics/auc/div_2!metrics/auc/strided_slice_6/stack#metrics/auc/strided_slice_6/stack_1#metrics/auc/strided_slice_6/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
k
!metrics/auc/strided_slice_7/stackConst*
dtype0*
_output_shapes
:*
valueB:
m
#metrics/auc/strided_slice_7/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
m
#metrics/auc/strided_slice_7/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
Т
metrics/auc/strided_slice_7StridedSlicemetrics/auc/div_2!metrics/auc/strided_slice_7/stack#metrics/auc/strided_slice_7/stack_1#metrics/auc/strided_slice_7/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч
y
metrics/auc/add_11Addmetrics/auc/strided_slice_6metrics/auc/strided_slice_7*
_output_shapes	
:Ч*
T0
\
metrics/auc/truediv_1/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
s
metrics/auc/truediv_1RealDivmetrics/auc/add_11metrics/auc/truediv_1/y*
T0*
_output_shapes	
:Ч
h
metrics/auc/Mul_5Mulmetrics/auc/sub_1metrics/auc/truediv_1*
T0*
_output_shapes	
:Ч
]
metrics/auc/Const_2Const*
valueB: *
dtype0*
_output_shapes
:

metrics/auc/update_opSummetrics/auc/Mul_5metrics/auc/Const_2*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
{
6metrics/auc_precision_recall/broadcast_weights/weightsConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Qmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Pmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
Pmetrics/auc_precision_recall/broadcast_weights/assert_broadcastable/values/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:

Ometrics/auc_precision_recall/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
g
_metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ё
>metrics/auc_precision_recall/broadcast_weights/ones_like/ShapeConst`^metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB"(      *
dtype0*
_output_shapes
:
х
>metrics/auc_precision_recall/broadcast_weights/ones_like/ConstConst`^metrics/auc_precision_recall/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?
ћ
8metrics/auc_precision_recall/broadcast_weights/ones_likeFill>metrics/auc_precision_recall/broadcast_weights/ones_like/Shape>metrics/auc_precision_recall/broadcast_weights/ones_like/Const*
T0*

index_type0*
_output_shapes

:(
а
.metrics/auc_precision_recall/broadcast_weightsMul6metrics/auc_precision_recall/broadcast_weights/weights8metrics/auc_precision_recall/broadcast_weights/ones_like*
T0*
_output_shapes

:(
h
#metrics/auc_precision_recall/Cast/xConst*
dtype0*
_output_shapes
: *
valueB
 *    
З
>metrics/auc_precision_recall/assert_greater_equal/GreaterEqualGreaterEqualhead/predictions/logistic#metrics/auc_precision_recall/Cast/x*
T0*
_output_shapes

:(

7metrics/auc_precision_recall/assert_greater_equal/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
ъ
5metrics/auc_precision_recall/assert_greater_equal/AllAll>metrics/auc_precision_recall/assert_greater_equal/GreaterEqual7metrics/auc_precision_recall/assert_greater_equal/Const*
_output_shapes
: *

Tidx0*
	keep_dims( 

>metrics/auc_precision_recall/assert_greater_equal/Assert/ConstConst*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]
Ю
@metrics/auc_precision_recall/assert_greater_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = 
­
@metrics/auc_precision_recall/assert_greater_equal/Assert/Const_2Const*=
value4B2 B,y (metrics/auc_precision_recall/Cast/x:0) = *
dtype0*
_output_shapes
: 
ц
Kmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/SwitchSwitch5metrics/auc_precision_recall/assert_greater_equal/All5metrics/auc_precision_recall/assert_greater_equal/All*
_output_shapes
: : *
T0

Щ
Mmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_tIdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
Ч
Mmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_fIdentityKmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 
А
Lmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_idIdentity5metrics/auc_precision_recall/assert_greater_equal/All*
T0
*
_output_shapes
: 
Ё
Imetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/NoOpNoOpN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t

Wmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependencyIdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_tJ^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/NoOp*
_output_shapes
: *
T0
*`
_classV
TRloc:@metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t

Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_0ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]
А
Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_1ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x >= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_3ConstN^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*=
value4B2 B,y (metrics/auc_precision_recall/Cast/x:0) = *
dtype0*
_output_shapes
: 
ђ
Kmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/AssertAssertRmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/SwitchRmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_0Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_1Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_3Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
Ю
Rmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/SwitchSwitch5metrics/auc_precision_recall/assert_greater_equal/AllLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
T0
*H
_class>
<:loc:@metrics/auc_precision_recall/assert_greater_equal/All*
_output_shapes
: : 
Ј
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logisticLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
Ќ
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2Switch#metrics/auc_precision_recall/Cast/xLmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0*6
_class,
*(loc:@metrics/auc_precision_recall/Cast/x

Ymetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency_1IdentityMmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_fL^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert*
T0
*`
_classV
TRloc:@metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
Г
Jmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/MergeMergeYmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency_1Wmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
j
%metrics/auc_precision_recall/Cast_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
А
8metrics/auc_precision_recall/assert_less_equal/LessEqual	LessEqualhead/predictions/logistic%metrics/auc_precision_recall/Cast_1/x*
_output_shapes

:(*
T0

4metrics/auc_precision_recall/assert_less_equal/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
о
2metrics/auc_precision_recall/assert_less_equal/AllAll8metrics/auc_precision_recall/assert_less_equal/LessEqual4metrics/auc_precision_recall/assert_less_equal/Const*

Tidx0*
	keep_dims( *
_output_shapes
: 

;metrics/auc_precision_recall/assert_less_equal/Assert/ConstConst*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]
Ы
=metrics/auc_precision_recall/assert_less_equal/Assert/Const_1Const*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 
Ќ
=metrics/auc_precision_recall/assert_less_equal/Assert/Const_2Const*?
value6B4 B.y (metrics/auc_precision_recall/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
н
Hmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/SwitchSwitch2metrics/auc_precision_recall/assert_less_equal/All2metrics/auc_precision_recall/assert_less_equal/All*
T0
*
_output_shapes
: : 
У
Jmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_tIdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
С
Jmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_fIdentityHmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Switch*
T0
*
_output_shapes
: 
Њ
Imetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_idIdentity2metrics/auc_precision_recall/assert_less_equal/All*
T0
*
_output_shapes
: 

Fmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/NoOpNoOpK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t
ѕ
Tmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependencyIdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_tG^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/NoOp*
_output_shapes
: *
T0
*]
_classS
QOloc:@metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t
њ
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_0ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*
dtype0*
_output_shapes
: *.
value%B# Bpredictions must be in [0, 1]
Њ
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_1ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*^
valueUBS BMCondition x <= y did not hold element-wise:x (head/predictions/logistic:0) = *
dtype0*
_output_shapes
: 

Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_3ConstK^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*?
value6B4 B.y (metrics/auc_precision_recall/Cast_1/x:0) = *
dtype0*
_output_shapes
: 
н
Hmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/AssertAssertOmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/SwitchOmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_0Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_1Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_3Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2*
T	
2*
	summarize
Т
Ometrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/SwitchSwitch2metrics/auc_precision_recall/assert_less_equal/AllImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0
*E
_class;
97loc:@metrics/auc_precision_recall/assert_less_equal/All
Ђ
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1Switchhead/predictions/logisticImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
T0*,
_class"
 loc:@head/predictions/logistic*(
_output_shapes
:(:(
Њ
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2Switch%metrics/auc_precision_recall/Cast_1/xImetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id*
_output_shapes
: : *
T0*8
_class.
,*loc:@metrics/auc_precision_recall/Cast_1/x
љ
Vmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency_1IdentityJmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_fI^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert*
T0
*]
_classS
QOloc:@metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f*
_output_shapes
: 
Њ
Gmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/MergeMergeVmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency_1Tmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
І
#metrics/auc_precision_recall/Cast_2Casthead/assert_range/IdentityK^metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/MergeH^metrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Merge*

SrcT0*
Truncate( *

DstT0
*
_output_shapes

:(
{
*metrics/auc_precision_recall/Reshape/shapeConst*
valueB"џџџџ   *
dtype0*
_output_shapes
:
­
$metrics/auc_precision_recall/ReshapeReshapehead/predictions/logistic*metrics/auc_precision_recall/Reshape/shape*
_output_shapes

:(*
T0*
Tshape0
}
,metrics/auc_precision_recall/Reshape_1/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:
Л
&metrics/auc_precision_recall/Reshape_1Reshape#metrics/auc_precision_recall/Cast_2,metrics/auc_precision_recall/Reshape_1/shape*
_output_shapes

:(*
T0
*
Tshape0

"metrics/auc_precision_recall/ConstConst*
dtype0*
_output_shapes	
:Ш*Й
valueЏBЌШ" ПжГЯЉЄ;ЯЉ$<Зўv<ЯЉЄ<CдЭ<Зўі<=ЯЉ$=	?9=CдM=}ib=Зўv=јЩ==2_=ЯЉЄ=lєЎ=	?Й=ІУ=CдЭ=ри=}iт=Дь=Зўі=ЊЄ >јЩ>Gя
>>ф9>2_>>ЯЉ$>Я)>lє.>Л4>	?9>Wd>>ІC>єЎH>CдM>љR>рX>.D]>}ib>Ыg>Дl>hйq>Зўv>$|>ЊЄ>Q7>јЩ> \>Gя>ю>><Ї>ф9>Ь>2_>йё>>(Ђ>ЯЉЄ>v<Ї>ЯЉ>ХaЌ>lєЎ>Б>ЛД>bЌЖ>	?Й>АбЛ>WdО>џіР>ІУ>MЦ>єЎШ>AЫ>CдЭ>ъfа>љв>9е>ри>Бк>.Dн>жжп>}iт>$ќф>Ыч>r!ъ>Дь>СFя>hйё>lє>Зўі>^љ>$ќ>ЌЖў>ЊЄ ?§э?Q7?Ѕ?јЩ?L? \?ѓЅ	?Gя
?8?ю?BЫ??щ]?<Ї?№?ф9?7?Ь?п?2_?Ј?йё?-;??дЭ ?("?{`#?ЯЉ$?#ѓ%?v<'?Ъ(?Я)?q+?Хa,?Ћ-?lє.?Р=0?1?gа2?Л4?c5?bЌ6?Еѕ7?	?9?]:?Аб;?=?Wd>?Ћ­??џі@?R@B?ІC?њвD?MF?ЁeG?єЎH?HјI?AK?яL?CдM?O?ъfP?>АQ?љR?хBT?9U?еV?рX?3hY?БZ?лњ[?.D]?^?жж_?) a?}ib?аВc?$ќd?xEf?Ыg?иh?r!j?Цjk?Дl?m§m?СFo?p?hйq?М"s?lt?cЕu?Зўv?
Hx?^y?Вкz?$|?Ym}?ЌЖ~? ?
u
+metrics/auc_precision_recall/ExpandDims/dimConst*
valueB:*
dtype0*
_output_shapes
:
М
'metrics/auc_precision_recall/ExpandDims
ExpandDims"metrics/auc_precision_recall/Const+metrics/auc_precision_recall/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:	Ш
s
"metrics/auc_precision_recall/stackConst*
dtype0*
_output_shapes
:*
valueB"   (   
В
!metrics/auc_precision_recall/TileTile'metrics/auc_precision_recall/ExpandDims"metrics/auc_precision_recall/stack*
T0*
_output_shapes
:	Ш(*

Tmultiples0
z
+metrics/auc_precision_recall/transpose/RankRank$metrics/auc_precision_recall/Reshape*
T0*
_output_shapes
: 
n
,metrics/auc_precision_recall/transpose/sub/yConst*
value	B :*
dtype0*
_output_shapes
: 
­
*metrics/auc_precision_recall/transpose/subSub+metrics/auc_precision_recall/transpose/Rank,metrics/auc_precision_recall/transpose/sub/y*
_output_shapes
: *
T0
t
2metrics/auc_precision_recall/transpose/Range/startConst*
dtype0*
_output_shapes
: *
value	B : 
t
2metrics/auc_precision_recall/transpose/Range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
ћ
,metrics/auc_precision_recall/transpose/RangeRange2metrics/auc_precision_recall/transpose/Range/start+metrics/auc_precision_recall/transpose/Rank2metrics/auc_precision_recall/transpose/Range/delta*

Tidx0*#
_output_shapes
:џџџџџџџџџ
Л
,metrics/auc_precision_recall/transpose/sub_1Sub*metrics/auc_precision_recall/transpose/sub,metrics/auc_precision_recall/transpose/Range*
T0*#
_output_shapes
:џџџџџџџџџ
Н
&metrics/auc_precision_recall/transpose	Transpose$metrics/auc_precision_recall/Reshape,metrics/auc_precision_recall/transpose/sub_1*
T0*
_output_shapes

:(*
Tperm0
~
-metrics/auc_precision_recall/Tile_1/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_1Tile&metrics/auc_precision_recall/transpose-metrics/auc_precision_recall/Tile_1/multiples*

Tmultiples0*
T0*
_output_shapes
:	Ш(
Ё
$metrics/auc_precision_recall/GreaterGreater#metrics/auc_precision_recall/Tile_1!metrics/auc_precision_recall/Tile*
T0*
_output_shapes
:	Ш(
|
'metrics/auc_precision_recall/LogicalNot
LogicalNot$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(
~
-metrics/auc_precision_recall/Tile_2/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_2Tile&metrics/auc_precision_recall/Reshape_1-metrics/auc_precision_recall/Tile_2/multiples*

Tmultiples0*
T0
*
_output_shapes
:	Ш(
}
)metrics/auc_precision_recall/LogicalNot_1
LogicalNot#metrics/auc_precision_recall/Tile_2*
_output_shapes
:	Ш(
}
,metrics/auc_precision_recall/Reshape_2/shapeConst*
valueB"   џџџџ*
dtype0*
_output_shapes
:
Ц
&metrics/auc_precision_recall/Reshape_2Reshape.metrics/auc_precision_recall/broadcast_weights,metrics/auc_precision_recall/Reshape_2/shape*
_output_shapes

:(*
T0*
Tshape0
~
-metrics/auc_precision_recall/Tile_3/multiplesConst*
valueB"Ш      *
dtype0*
_output_shapes
:
О
#metrics/auc_precision_recall/Tile_3Tile&metrics/auc_precision_recall/Reshape_2-metrics/auc_precision_recall/Tile_3/multiples*
T0*
_output_shapes
:	Ш(*

Tmultiples0
Ь
=metrics/auc_precision_recall/true_positives/Initializer/zerosConst*
valueBШ*    *>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
dtype0*
_output_shapes	
:Ш
й
+metrics/auc_precision_recall/true_positives
VariableV2*
shared_name *>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
З
2metrics/auc_precision_recall/true_positives/AssignAssign+metrics/auc_precision_recall/true_positives=metrics/auc_precision_recall/true_positives/Initializer/zeros*
use_locking(*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
validate_shape(*
_output_shapes	
:Ш
Я
0metrics/auc_precision_recall/true_positives/readIdentity+metrics/auc_precision_recall/true_positives*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
_output_shapes	
:Ш
Ё
'metrics/auc_precision_recall/LogicalAnd
LogicalAnd#metrics/auc_precision_recall/Tile_2$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(

$metrics/auc_precision_recall/ToFloatCast'metrics/auc_precision_recall/LogicalAnd*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(

 metrics/auc_precision_recall/mulMul$metrics/auc_precision_recall/ToFloat#metrics/auc_precision_recall/Tile_3*
T0*
_output_shapes
:	Ш(
t
2metrics/auc_precision_recall/Sum/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Р
 metrics/auc_precision_recall/SumSum metrics/auc_precision_recall/mul2metrics/auc_precision_recall/Sum/reduction_indices*

Tidx0*
	keep_dims( *
T0*
_output_shapes	
:Ш
ћ
&metrics/auc_precision_recall/AssignAdd	AssignAdd+metrics/auc_precision_recall/true_positives metrics/auc_precision_recall/Sum*
_output_shapes	
:Ш*
use_locking( *
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_positives
Ю
>metrics/auc_precision_recall/false_negatives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*
valueBШ*    *?
_class5
31loc:@metrics/auc_precision_recall/false_negatives
л
,metrics/auc_precision_recall/false_negatives
VariableV2*
shape:Ш*
dtype0*
_output_shapes	
:Ш*
shared_name *?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
	container 
Л
3metrics/auc_precision_recall/false_negatives/AssignAssign,metrics/auc_precision_recall/false_negatives>metrics/auc_precision_recall/false_negatives/Initializer/zeros*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(
в
1metrics/auc_precision_recall/false_negatives/readIdentity,metrics/auc_precision_recall/false_negatives*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
_output_shapes	
:Ш
І
)metrics/auc_precision_recall/LogicalAnd_1
LogicalAnd#metrics/auc_precision_recall/Tile_2'metrics/auc_precision_recall/LogicalNot*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_1Cast)metrics/auc_precision_recall/LogicalAnd_1*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
 
"metrics/auc_precision_recall/mul_1Mul&metrics/auc_precision_recall/ToFloat_1#metrics/auc_precision_recall/Tile_3*
_output_shapes
:	Ш(*
T0
v
4metrics/auc_precision_recall/Sum_1/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Ц
"metrics/auc_precision_recall/Sum_1Sum"metrics/auc_precision_recall/mul_14metrics/auc_precision_recall/Sum_1/reduction_indices*
T0*
_output_shapes	
:Ш*

Tidx0*
	keep_dims( 

(metrics/auc_precision_recall/AssignAdd_1	AssignAdd,metrics/auc_precision_recall/false_negatives"metrics/auc_precision_recall/Sum_1*
_output_shapes	
:Ш*
use_locking( *
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives
Ь
=metrics/auc_precision_recall/true_negatives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*
valueBШ*    *>
_class4
20loc:@metrics/auc_precision_recall/true_negatives
й
+metrics/auc_precision_recall/true_negatives
VariableV2*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш*
shared_name *>
_class4
20loc:@metrics/auc_precision_recall/true_negatives
З
2metrics/auc_precision_recall/true_negatives/AssignAssign+metrics/auc_precision_recall/true_negatives=metrics/auc_precision_recall/true_negatives/Initializer/zeros*
use_locking(*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
validate_shape(*
_output_shapes	
:Ш
Я
0metrics/auc_precision_recall/true_negatives/readIdentity+metrics/auc_precision_recall/true_negatives*
_output_shapes	
:Ш*
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives
Ќ
)metrics/auc_precision_recall/LogicalAnd_2
LogicalAnd)metrics/auc_precision_recall/LogicalNot_1'metrics/auc_precision_recall/LogicalNot*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_2Cast)metrics/auc_precision_recall/LogicalAnd_2*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
 
"metrics/auc_precision_recall/mul_2Mul&metrics/auc_precision_recall/ToFloat_2#metrics/auc_precision_recall/Tile_3*
T0*
_output_shapes
:	Ш(
v
4metrics/auc_precision_recall/Sum_2/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Ц
"metrics/auc_precision_recall/Sum_2Sum"metrics/auc_precision_recall/mul_24metrics/auc_precision_recall/Sum_2/reduction_indices*
T0*
_output_shapes	
:Ш*

Tidx0*
	keep_dims( 
џ
(metrics/auc_precision_recall/AssignAdd_2	AssignAdd+metrics/auc_precision_recall/true_negatives"metrics/auc_precision_recall/Sum_2*
use_locking( *
T0*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
_output_shapes	
:Ш
Ю
>metrics/auc_precision_recall/false_positives/Initializer/zerosConst*
dtype0*
_output_shapes	
:Ш*
valueBШ*    *?
_class5
31loc:@metrics/auc_precision_recall/false_positives
л
,metrics/auc_precision_recall/false_positives
VariableV2*
shared_name *?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
	container *
shape:Ш*
dtype0*
_output_shapes	
:Ш
Л
3metrics/auc_precision_recall/false_positives/AssignAssign,metrics/auc_precision_recall/false_positives>metrics/auc_precision_recall/false_positives/Initializer/zeros*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
validate_shape(*
_output_shapes	
:Ш*
use_locking(
в
1metrics/auc_precision_recall/false_positives/readIdentity,metrics/auc_precision_recall/false_positives*
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
_output_shapes	
:Ш
Љ
)metrics/auc_precision_recall/LogicalAnd_3
LogicalAnd)metrics/auc_precision_recall/LogicalNot_1$metrics/auc_precision_recall/Greater*
_output_shapes
:	Ш(
Ђ
&metrics/auc_precision_recall/ToFloat_3Cast)metrics/auc_precision_recall/LogicalAnd_3*

SrcT0
*
Truncate( *

DstT0*
_output_shapes
:	Ш(
 
"metrics/auc_precision_recall/mul_3Mul&metrics/auc_precision_recall/ToFloat_3#metrics/auc_precision_recall/Tile_3*
T0*
_output_shapes
:	Ш(
v
4metrics/auc_precision_recall/Sum_3/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
Ц
"metrics/auc_precision_recall/Sum_3Sum"metrics/auc_precision_recall/mul_34metrics/auc_precision_recall/Sum_3/reduction_indices*

Tidx0*
	keep_dims( *
T0*
_output_shapes	
:Ш

(metrics/auc_precision_recall/AssignAdd_3	AssignAdd,metrics/auc_precision_recall/false_positives"metrics/auc_precision_recall/Sum_3*
_output_shapes	
:Ш*
use_locking( *
T0*?
_class5
31loc:@metrics/auc_precision_recall/false_positives
g
"metrics/auc_precision_recall/add/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
Ѓ
 metrics/auc_precision_recall/addAdd0metrics/auc_precision_recall/true_positives/read"metrics/auc_precision_recall/add/y*
T0*
_output_shapes	
:Ш
Д
"metrics/auc_precision_recall/add_1Add0metrics/auc_precision_recall/true_positives/read1metrics/auc_precision_recall/false_negatives/read*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_2/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

"metrics/auc_precision_recall/add_2Add"metrics/auc_precision_recall/add_1$metrics/auc_precision_recall/add_2/y*
T0*
_output_shapes	
:Ш

 metrics/auc_precision_recall/divRealDiv metrics/auc_precision_recall/add"metrics/auc_precision_recall/add_2*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_3/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 
Ї
"metrics/auc_precision_recall/add_3Add0metrics/auc_precision_recall/true_positives/read$metrics/auc_precision_recall/add_3/y*
T0*
_output_shapes	
:Ш
Д
"metrics/auc_precision_recall/add_4Add0metrics/auc_precision_recall/true_positives/read1metrics/auc_precision_recall/false_positives/read*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_5/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

"metrics/auc_precision_recall/add_5Add"metrics/auc_precision_recall/add_4$metrics/auc_precision_recall/add_5/y*
_output_shapes	
:Ш*
T0

"metrics/auc_precision_recall/div_1RealDiv"metrics/auc_precision_recall/add_3"metrics/auc_precision_recall/add_5*
T0*
_output_shapes	
:Ш
z
0metrics/auc_precision_recall/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
}
2metrics/auc_precision_recall/strided_slice/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
|
2metrics/auc_precision_recall/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

*metrics/auc_precision_recall/strided_sliceStridedSlice metrics/auc_precision_recall/div0metrics/auc_precision_recall/strided_slice/stack2metrics/auc_precision_recall/strided_slice/stack_12metrics/auc_precision_recall/strided_slice/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
T0*
Index0
|
2metrics/auc_precision_recall/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
~
4metrics/auc_precision_recall/strided_slice_1/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_1StridedSlice metrics/auc_precision_recall/div2metrics/auc_precision_recall/strided_slice_1/stack4metrics/auc_precision_recall/strided_slice_1/stack_14metrics/auc_precision_recall/strided_slice_1/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0
Ї
 metrics/auc_precision_recall/subSub*metrics/auc_precision_recall/strided_slice,metrics/auc_precision_recall/strided_slice_1*
_output_shapes	
:Ч*
T0
|
2metrics/auc_precision_recall/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 

4metrics/auc_precision_recall/strided_slice_2/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

,metrics/auc_precision_recall/strided_slice_2StridedSlice"metrics/auc_precision_recall/div_12metrics/auc_precision_recall/strided_slice_2/stack4metrics/auc_precision_recall/strided_slice_2/stack_14metrics/auc_precision_recall/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч
|
2metrics/auc_precision_recall/strided_slice_3/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_3/stack_1Const*
valueB: *
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_3/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_3StridedSlice"metrics/auc_precision_recall/div_12metrics/auc_precision_recall/strided_slice_3/stack4metrics/auc_precision_recall/strided_slice_3/stack_14metrics/auc_precision_recall/strided_slice_3/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
T0*
Index0
Ћ
"metrics/auc_precision_recall/add_6Add,metrics/auc_precision_recall/strided_slice_2,metrics/auc_precision_recall/strided_slice_3*
T0*
_output_shapes	
:Ч
k
&metrics/auc_precision_recall/truediv/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
Ё
$metrics/auc_precision_recall/truedivRealDiv"metrics/auc_precision_recall/add_6&metrics/auc_precision_recall/truediv/y*
T0*
_output_shapes	
:Ч

"metrics/auc_precision_recall/Mul_4Mul metrics/auc_precision_recall/sub$metrics/auc_precision_recall/truediv*
T0*
_output_shapes	
:Ч
n
$metrics/auc_precision_recall/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Б
"metrics/auc_precision_recall/valueSum"metrics/auc_precision_recall/Mul_4$metrics/auc_precision_recall/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
i
$metrics/auc_precision_recall/add_7/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

"metrics/auc_precision_recall/add_7Add&metrics/auc_precision_recall/AssignAdd$metrics/auc_precision_recall/add_7/y*
T0*
_output_shapes	
:Ш
Ё
"metrics/auc_precision_recall/add_8Add&metrics/auc_precision_recall/AssignAdd(metrics/auc_precision_recall/AssignAdd_1*
T0*
_output_shapes	
:Ш
i
$metrics/auc_precision_recall/add_9/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

"metrics/auc_precision_recall/add_9Add"metrics/auc_precision_recall/add_8$metrics/auc_precision_recall/add_9/y*
T0*
_output_shapes	
:Ш

"metrics/auc_precision_recall/div_2RealDiv"metrics/auc_precision_recall/add_7"metrics/auc_precision_recall/add_9*
_output_shapes	
:Ш*
T0
j
%metrics/auc_precision_recall/add_10/yConst*
dtype0*
_output_shapes
: *
valueB
 *Н75

#metrics/auc_precision_recall/add_10Add&metrics/auc_precision_recall/AssignAdd%metrics/auc_precision_recall/add_10/y*
_output_shapes	
:Ш*
T0
Ђ
#metrics/auc_precision_recall/add_11Add&metrics/auc_precision_recall/AssignAdd(metrics/auc_precision_recall/AssignAdd_3*
T0*
_output_shapes	
:Ш
j
%metrics/auc_precision_recall/add_12/yConst*
valueB
 *Н75*
dtype0*
_output_shapes
: 

#metrics/auc_precision_recall/add_12Add#metrics/auc_precision_recall/add_11%metrics/auc_precision_recall/add_12/y*
T0*
_output_shapes	
:Ш

"metrics/auc_precision_recall/div_3RealDiv#metrics/auc_precision_recall/add_10#metrics/auc_precision_recall/add_12*
T0*
_output_shapes	
:Ш
|
2metrics/auc_precision_recall/strided_slice_4/stackConst*
valueB: *
dtype0*
_output_shapes
:

4metrics/auc_precision_recall/strided_slice_4/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_4StridedSlice"metrics/auc_precision_recall/div_22metrics/auc_precision_recall/strided_slice_4/stack4metrics/auc_precision_recall/strided_slice_4/stack_14metrics/auc_precision_recall/strided_slice_4/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
T0*
Index0
|
2metrics/auc_precision_recall/strided_slice_5/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_5/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
~
4metrics/auc_precision_recall/strided_slice_5/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_5StridedSlice"metrics/auc_precision_recall/div_22metrics/auc_precision_recall/strided_slice_5/stack4metrics/auc_precision_recall/strided_slice_5/stack_14metrics/auc_precision_recall/strided_slice_5/stack_2*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч
Ћ
"metrics/auc_precision_recall/sub_1Sub,metrics/auc_precision_recall/strided_slice_4,metrics/auc_precision_recall/strided_slice_5*
_output_shapes	
:Ч*
T0
|
2metrics/auc_precision_recall/strided_slice_6/stackConst*
valueB: *
dtype0*
_output_shapes
:

4metrics/auc_precision_recall/strided_slice_6/stack_1Const*
valueB:Ч*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_6/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_6StridedSlice"metrics/auc_precision_recall/div_32metrics/auc_precision_recall/strided_slice_6/stack4metrics/auc_precision_recall/strided_slice_6/stack_14metrics/auc_precision_recall/strided_slice_6/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes	
:Ч*
Index0*
T0
|
2metrics/auc_precision_recall/strided_slice_7/stackConst*
valueB:*
dtype0*
_output_shapes
:
~
4metrics/auc_precision_recall/strided_slice_7/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
~
4metrics/auc_precision_recall/strided_slice_7/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

,metrics/auc_precision_recall/strided_slice_7StridedSlice"metrics/auc_precision_recall/div_32metrics/auc_precision_recall/strided_slice_7/stack4metrics/auc_precision_recall/strided_slice_7/stack_14metrics/auc_precision_recall/strided_slice_7/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes	
:Ч*
Index0*
T0
Ќ
#metrics/auc_precision_recall/add_13Add,metrics/auc_precision_recall/strided_slice_6,metrics/auc_precision_recall/strided_slice_7*
T0*
_output_shapes	
:Ч
m
(metrics/auc_precision_recall/truediv_1/yConst*
valueB
 *   @*
dtype0*
_output_shapes
: 
І
&metrics/auc_precision_recall/truediv_1RealDiv#metrics/auc_precision_recall/add_13(metrics/auc_precision_recall/truediv_1/y*
T0*
_output_shapes	
:Ч

"metrics/auc_precision_recall/Mul_5Mul"metrics/auc_precision_recall/sub_1&metrics/auc_precision_recall/truediv_1*
_output_shapes	
:Ч*
T0
n
$metrics/auc_precision_recall/Const_2Const*
valueB: *
dtype0*
_output_shapes
:
Е
&metrics/auc_precision_recall/update_opSum"metrics/auc_precision_recall/Mul_5$metrics/auc_precision_recall/Const_2*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

mean/total/Initializer/zerosConst*
valueB
 *    *
_class
loc:@mean/total*
dtype0*
_output_shapes
: 


mean/total
VariableV2*
shared_name *
_class
loc:@mean/total*
	container *
shape: *
dtype0*
_output_shapes
: 
Ў
mean/total/AssignAssign
mean/totalmean/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean/total*
validate_shape(*
_output_shapes
: 
g
mean/total/readIdentity
mean/total*
T0*
_class
loc:@mean/total*
_output_shapes
: 

mean/count/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *
_class
loc:@mean/count


mean/count
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean/count*
	container 
Ў
mean/count/AssignAssign
mean/countmean/count/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@mean/count
g
mean/count/readIdentity
mean/count*
_output_shapes
: *
T0*
_class
loc:@mean/count
K
	mean/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
_
mean/ToFloatCast	mean/Size*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0
M

mean/ConstConst*
valueB *
dtype0*
_output_shapes
: 
q
mean/SumSumhead/weighted_loss/Sum
mean/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

mean/AssignAdd	AssignAdd
mean/totalmean/Sum*
use_locking( *
T0*
_class
loc:@mean/total*
_output_shapes
: 
Ѓ
mean/AssignAdd_1	AssignAdd
mean/countmean/ToFloat^head/weighted_loss/Sum*
_output_shapes
: *
use_locking( *
T0*
_class
loc:@mean/count
Z
mean/truedivRealDivmean/total/readmean/count/read*
T0*
_output_shapes
: 
T
mean/zeros_likeConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
mean/GreaterGreatermean/count/readmean/zeros_like*
T0*
_output_shapes
: 
b

mean/valueSelectmean/Greatermean/truedivmean/zeros_like*
_output_shapes
: *
T0
\
mean/truediv_1RealDivmean/AssignAddmean/AssignAdd_1*
_output_shapes
: *
T0
V
mean/zeros_like_1Const*
valueB
 *    *
dtype0*
_output_shapes
: 
_
mean/Greater_1Greatermean/AssignAdd_1mean/zeros_like_1*
T0*
_output_shapes
: 
l
mean/update_opSelectmean/Greater_1mean/truediv_1mean/zeros_like_1*
T0*
_output_shapes
: 
Ф

group_depsNoOp^mean/update_op^metrics/accuracy/update_op$^metrics/accuracy_baseline/update_op^metrics/auc/update_op'^metrics/auc_precision_recall/update_op^metrics/average_loss/update_op^metrics/label/mean/update_op^metrics/precision/update_op"^metrics/prediction/mean/update_op^metrics/recall/update_op
{
eval_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 

	eval_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@eval_step*
	container *
shape: 
Њ
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@eval_step
d
eval_step/readIdentity	eval_step*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
Q
AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 

	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
use_locking(*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
U
readIdentity	eval_step
^AssignAdd^group_deps*
T0	*
_output_shapes
: 
;
IdentityIdentityread*
T0	*
_output_shapes
: 

initNoOp%^dnn/hiddenlayer_0/bias/part_0/Assign'^dnn/hiddenlayer_0/kernel/part_0/Assign%^dnn/hiddenlayer_1/bias/part_0/Assign'^dnn/hiddenlayer_1/kernel/part_0/Assign%^dnn/hiddenlayer_2/bias/part_0/Assign'^dnn/hiddenlayer_2/kernel/part_0/Assign%^dnn/hiddenlayer_3/bias/part_0/Assign'^dnn/hiddenlayer_3/kernel/part_0/Assign^dnn/logits/bias/part_0/Assign ^dnn/logits/kernel/part_0/Assign^global_step/Assign/^linear/linear_model/bias_weights/part_0/Assign5^linear/linear_model/company_xf/weights/part_0/Assign>^linear/linear_model/dropoff_latitude_xf/weights/part_0/Assign?^linear/linear_model/dropoff_longitude_xf/weights/part_0/Assign:^linear/linear_model/payment_type_xf/weights/part_0/Assign=^linear/linear_model/pickup_latitude_xf/weights/part_0/Assign>^linear/linear_model/pickup_longitude_xf/weights/part_0/Assign<^linear/linear_model/trip_start_day_xf/weights/part_0/Assign=^linear/linear_model/trip_start_hour_xf/weights/part_0/Assign>^linear/linear_model/trip_start_month_xf/weights/part_0/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 

3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
{
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
y
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 

4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedmetrics/label/mean/total*+
_class!
loc:@metrics/label/mean/total*
dtype0*
_output_shapes
: 
Л
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializedmetrics/label/mean/count*
dtype0*
_output_shapes
: *+
_class!
loc:@metrics/label/mean/count
П
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedmetrics/average_loss/total*-
_class#
!loc:@metrics/average_loss/total*
dtype0*
_output_shapes
: 
П
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializedmetrics/average_loss/count*
dtype0*
_output_shapes
: *-
_class#
!loc:@metrics/average_loss/count
З
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedmetrics/accuracy/total*)
_class
loc:@metrics/accuracy/total*
dtype0*
_output_shapes
: 
З
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializedmetrics/accuracy/count*)
_class
loc:@metrics/accuracy/count*
dtype0*
_output_shapes
: 
з
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized&metrics/precision/true_positives/count*9
_class/
-+loc:@metrics/precision/true_positives/count*
dtype0*
_output_shapes
: 
й
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitialized'metrics/precision/false_positives/count*
dtype0*
_output_shapes
: *:
_class0
.,loc:@metrics/precision/false_positives/count
б
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized#metrics/recall/true_positives/count*6
_class,
*(loc:@metrics/recall/true_positives/count*
dtype0*
_output_shapes
: 
д
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized$metrics/recall/false_negatives/count*7
_class-
+)loc:@metrics/recall/false_negatives/count*
dtype0*
_output_shapes
: 
Ц
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitializedmetrics/prediction/mean/total*
dtype0*
_output_shapes
: *0
_class&
$"loc:@metrics/prediction/mean/total
Ц
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitializedmetrics/prediction/mean/count*
dtype0*
_output_shapes
: *0
_class&
$"loc:@metrics/prediction/mean/count
Р
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitializedmetrics/auc/true_positives*
dtype0*
_output_shapes
: *-
_class#
!loc:@metrics/auc/true_positives
Т
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitializedmetrics/auc/false_negatives*
dtype0*
_output_shapes
: *.
_class$
" loc:@metrics/auc/false_negatives
Р
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitializedmetrics/auc/true_negatives*-
_class#
!loc:@metrics/auc/true_negatives*
dtype0*
_output_shapes
: 
Т
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitializedmetrics/auc/false_positives*.
_class$
" loc:@metrics/auc/false_positives*
dtype0*
_output_shapes
: 
т
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized+metrics/auc_precision_recall/true_positives*>
_class4
20loc:@metrics/auc_precision_recall/true_positives*
dtype0*
_output_shapes
: 
ф
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized,metrics/auc_precision_recall/false_negatives*?
_class5
31loc:@metrics/auc_precision_recall/false_negatives*
dtype0*
_output_shapes
: 
т
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized+metrics/auc_precision_recall/true_negatives*>
_class4
20loc:@metrics/auc_precision_recall/true_negatives*
dtype0*
_output_shapes
: 
ф
7report_uninitialized_variables/IsVariableInitialized_20IsVariableInitialized,metrics/auc_precision_recall/false_positives*?
_class5
31loc:@metrics/auc_precision_recall/false_positives*
dtype0*
_output_shapes
: 
 
7report_uninitialized_variables/IsVariableInitialized_21IsVariableInitialized
mean/total*
_class
loc:@mean/total*
dtype0*
_output_shapes
: 
 
7report_uninitialized_variables/IsVariableInitialized_22IsVariableInitialized
mean/count*
_class
loc:@mean/count*
dtype0*
_output_shapes
: 

7report_uninitialized_variables/IsVariableInitialized_23IsVariableInitialized	eval_step*
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 
э
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized1report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_196report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_197report_uninitialized_variables/IsVariableInitialized_207report_uninitialized_variables/IsVariableInitialized_217report_uninitialized_variables/IsVariableInitialized_227report_uninitialized_variables/IsVariableInitialized_23"/device:CPU:0*
T0
*

axis *
N,*
_output_shapes
:,

)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:,

$report_uninitialized_variables/ConstConst"/device:CPU:0*І
valueB,Bglobal_stepBdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0Bdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0Bdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0Bdnn/hiddenlayer_3/kernel/part_0Bdnn/hiddenlayer_3/bias/part_0Bdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B-linear/linear_model/company_xf/weights/part_0B6linear/linear_model/dropoff_latitude_xf/weights/part_0B7linear/linear_model/dropoff_longitude_xf/weights/part_0B2linear/linear_model/payment_type_xf/weights/part_0B5linear/linear_model/pickup_latitude_xf/weights/part_0B6linear/linear_model/pickup_longitude_xf/weights/part_0B4linear/linear_model/trip_start_day_xf/weights/part_0B5linear/linear_model/trip_start_hour_xf/weights/part_0B6linear/linear_model/trip_start_month_xf/weights/part_0B'linear/linear_model/bias_weights/part_0Bmetrics/label/mean/totalBmetrics/label/mean/countBmetrics/average_loss/totalBmetrics/average_loss/countBmetrics/accuracy/totalBmetrics/accuracy/countB&metrics/precision/true_positives/countB'metrics/precision/false_positives/countB#metrics/recall/true_positives/countB$metrics/recall/false_negatives/countBmetrics/prediction/mean/totalBmetrics/prediction/mean/countBmetrics/auc/true_positivesBmetrics/auc/false_negativesBmetrics/auc/true_negativesBmetrics/auc/false_positivesB+metrics/auc_precision_recall/true_positivesB,metrics/auc_precision_recall/false_negativesB+metrics/auc_precision_recall/true_negativesB,metrics/auc_precision_recall/false_positivesB
mean/totalB
mean/countB	eval_step*
dtype0*
_output_shapes
:,

1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
ш
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
T0*
Index0*
shrink_axis_mask 

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
№
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes
: 

3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:,*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
№
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
T0*
Index0
О
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
ї
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*
T0*
N*
_output_shapes
:*

Tidx0
к
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:,

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
ъ
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
_output_shapes
:,*
T0
*
Tshape0
В
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:џџџџџџџџџ
Х
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*
T0	*#
_output_shapes
:џџџџџџџџџ*
squeeze_dims


9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
Х
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*
Tindices0	*
Tparams0*#
_output_shapes
:џџџџџџџџџ*
Taxis0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
M
concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
О
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*

Tidx0*
T0*
N*#
_output_shapes
:џџџџџџџџџ
Ё
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 

5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
}
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
{
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOp-linear/linear_model/company_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOp2linear/linear_model/payment_type_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOp4linear/linear_model/trip_start_day_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOp6linear/linear_model/trip_start_month_xf/weights/part_0*
_output_shapes
: 

6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOp'linear/linear_model/bias_weights/part_0*
_output_shapes
: 


&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized3report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_19"/device:CPU:0*
T0
*

axis *
N*
_output_shapes
:

+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:
Я
&report_uninitialized_variables_1/ConstConst"/device:CPU:0*х
valueлBиBglobal_stepBdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0Bdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0Bdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0Bdnn/hiddenlayer_3/kernel/part_0Bdnn/hiddenlayer_3/bias/part_0Bdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B-linear/linear_model/company_xf/weights/part_0B6linear/linear_model/dropoff_latitude_xf/weights/part_0B7linear/linear_model/dropoff_longitude_xf/weights/part_0B2linear/linear_model/payment_type_xf/weights/part_0B5linear/linear_model/pickup_latitude_xf/weights/part_0B6linear/linear_model/pickup_longitude_xf/weights/part_0B4linear/linear_model/trip_start_day_xf/weights/part_0B5linear/linear_model/trip_start_hour_xf/weights/part_0B6linear/linear_model/trip_start_month_xf/weights/part_0B'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:

3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ђ
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
њ
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
њ
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
Т
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*
N*
_output_shapes
:*

Tidx0*
T0
р
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
џџџџџџџџџ
№
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:
Ж
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:џџџџџџџџџ
Щ
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
T0	*#
_output_shapes
:џџџџџџџџџ*
squeeze_dims


;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
Э
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*#
_output_shapes
:џџџџџџџџџ*
Taxis0*
Tindices0	*
Tparams0

init_2NoOp^eval_step/Assign^mean/count/Assign^mean/total/Assign^metrics/accuracy/count/Assign^metrics/accuracy/total/Assign#^metrics/auc/false_negatives/Assign#^metrics/auc/false_positives/Assign"^metrics/auc/true_negatives/Assign"^metrics/auc/true_positives/Assign4^metrics/auc_precision_recall/false_negatives/Assign4^metrics/auc_precision_recall/false_positives/Assign3^metrics/auc_precision_recall/true_negatives/Assign3^metrics/auc_precision_recall/true_positives/Assign"^metrics/average_loss/count/Assign"^metrics/average_loss/total/Assign ^metrics/label/mean/count/Assign ^metrics/label/mean/total/Assign/^metrics/precision/false_positives/count/Assign.^metrics/precision/true_positives/count/Assign%^metrics/prediction/mean/count/Assign%^metrics/prediction/mean/total/Assign,^metrics/recall/false_negatives/count/Assign+^metrics/recall/true_positives/count/Assign

init_all_tablesNoOp

init_3NoOp
8
group_deps_2NoOp^init_2^init_3^init_all_tables

Merge/MergeSummaryMergeSummary7read_batch_features/file_name_queue/fraction_of_32_full2read_batch_features/fraction_over_9880_of_120_full]read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation-dnn/dnn/hiddenlayer_3/fraction_of_zero_values dnn/dnn/hiddenlayer_3/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activationlinear/biaslinear/fraction_of_zero_weights%linear/linear/fraction_of_zero_valueslinear/linear/activation*
N*
_output_shapes
: 
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
r
save/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
:d
X
save/IdentityIdentitysave/Read/ReadVariableOp*
_output_shapes
:d*
T0
^
save/Identity_1Identitysave/Identity"/device:CPU:0*
_output_shapes
:d*
T0
z
save/Read_1/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

:d
`
save/Identity_2Identitysave/Read_1/ReadVariableOp*
T0*
_output_shapes

:d
d
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
T0*
_output_shapes

:d
t
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:F
\
save/Identity_4Identitysave/Read_2/ReadVariableOp*
_output_shapes
:F*
T0
`
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
T0*
_output_shapes
:F
z
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

:dF
`
save/Identity_6Identitysave/Read_3/ReadVariableOp*
_output_shapes

:dF*
T0
d
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
T0*
_output_shapes

:dF
t
save/Read_4/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:0
\
save/Identity_8Identitysave/Read_4/ReadVariableOp*
_output_shapes
:0*
T0
`
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
T0*
_output_shapes
:0
z
save/Read_5/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:F0
a
save/Identity_10Identitysave/Read_5/ReadVariableOp*
_output_shapes

:F0*
T0
f
save/Identity_11Identitysave/Identity_10"/device:CPU:0*
T0*
_output_shapes

:F0
t
save/Read_6/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes
:"
]
save/Identity_12Identitysave/Read_6/ReadVariableOp*
_output_shapes
:"*
T0
b
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
T0*
_output_shapes
:"
z
save/Read_7/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes

:0"
a
save/Identity_14Identitysave/Read_7/ReadVariableOp*
T0*
_output_shapes

:0"
f
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
T0*
_output_shapes

:0"
m
save/Read_8/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
]
save/Identity_16Identitysave/Read_8/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
T0*
_output_shapes
:
s
save/Read_9/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:"
a
save/Identity_18Identitysave/Read_9/ReadVariableOp*
_output_shapes

:"*
T0
f
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
_output_shapes

:"*
T0

save/Read_10/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
:
^
save/Identity_20Identitysave/Read_10/ReadVariableOp*
_output_shapes
:*
T0
b
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
T0*
_output_shapes
:

save/Read_11/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
c
save/Identity_22Identitysave/Read_11/ReadVariableOp*
_output_shapes
:	ђ*
T0
g
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/Read_12/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_24Identitysave/Read_12/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
T0*
_output_shapes

:


save/Read_13/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_26Identitysave/Read_13/ReadVariableOp*
_output_shapes

:
*
T0
f
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
T0*
_output_shapes

:


save/Read_14/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0*
dtype0*
_output_shapes
:	ђ
c
save/Identity_28Identitysave/Read_14/ReadVariableOp*
T0*
_output_shapes
:	ђ
g
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/Read_15/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_30Identitysave/Read_15/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
_output_shapes

:
*
T0

save/Read_16/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0*
dtype0*
_output_shapes

:

b
save/Identity_32Identitysave/Read_16/ReadVariableOp*
T0*
_output_shapes

:

f
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
T0*
_output_shapes

:


save/Read_17/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_34Identitysave/Read_17/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_35Identitysave/Identity_34"/device:CPU:0*
T0*
_output_shapes

:

save/Read_18/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_36Identitysave/Read_18/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_37Identitysave/Identity_36"/device:CPU:0*
T0*
_output_shapes

:

save/Read_19/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0*
dtype0*
_output_shapes

:
b
save/Identity_38Identitysave/Read_19/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_39Identitysave/Identity_38"/device:CPU:0*
_output_shapes

:*
T0

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_00039c177e9f42258a414a5074cef31d/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
{
save/SaveV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
t
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 

save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/Read_20/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:d
m
save/Identity_40Identitysave/Read_20/ReadVariableOp"/device:CPU:0*
_output_shapes
:d*
T0
b
save/Identity_41Identitysave/Identity_40"/device:CPU:0*
T0*
_output_shapes
:d

save/Read_21/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:d
q
save/Identity_42Identitysave/Read_21/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:d
f
save/Identity_43Identitysave/Identity_42"/device:CPU:0*
T0*
_output_shapes

:d

save/Read_22/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:F
m
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:F
b
save/Identity_45Identitysave/Identity_44"/device:CPU:0*
_output_shapes
:F*
T0

save/Read_23/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:dF
q
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:dF
f
save/Identity_47Identitysave/Identity_46"/device:CPU:0*
T0*
_output_shapes

:dF

save/Read_24/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:0
m
save/Identity_48Identitysave/Read_24/ReadVariableOp"/device:CPU:0*
_output_shapes
:0*
T0
b
save/Identity_49Identitysave/Identity_48"/device:CPU:0*
T0*
_output_shapes
:0

save/Read_25/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:F0
q
save/Identity_50Identitysave/Read_25/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:F0
f
save/Identity_51Identitysave/Identity_50"/device:CPU:0*
T0*
_output_shapes

:F0

save/Read_26/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:"
m
save/Identity_52Identitysave/Read_26/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:"
b
save/Identity_53Identitysave/Identity_52"/device:CPU:0*
_output_shapes
:"*
T0

save/Read_27/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:0"
q
save/Identity_54Identitysave/Read_27/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:0"
f
save/Identity_55Identitysave/Identity_54"/device:CPU:0*
T0*
_output_shapes

:0"
}
save/Read_28/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_56Identitysave/Read_28/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_57Identitysave/Identity_56"/device:CPU:0*
T0*
_output_shapes
:

save/Read_29/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:"
q
save/Identity_58Identitysave/Read_29/ReadVariableOp"/device:CPU:0*
_output_shapes

:"*
T0
f
save/Identity_59Identitysave/Identity_58"/device:CPU:0*
T0*
_output_shapes

:"

save/Read_30/ReadVariableOpReadVariableOp'linear/linear_model/bias_weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_60Identitysave/Read_30/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_61Identitysave/Identity_60"/device:CPU:0*
T0*
_output_shapes
:

save/Read_31/ReadVariableOpReadVariableOp-linear/linear_model/company_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	ђ
r
save/Identity_62Identitysave/Read_31/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	ђ
g
save/Identity_63Identitysave/Identity_62"/device:CPU:0*
T0*
_output_shapes
:	ђ
Ё
save/Read_32/ReadVariableOpReadVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_64Identitysave/Read_32/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_65Identitysave/Identity_64"/device:CPU:0*
T0*
_output_shapes

:

Ђ
save/Read_33/ReadVariableOpReadVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_66Identitysave/Read_33/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_67Identitysave/Identity_66"/device:CPU:0*
T0*
_output_shapes

:


save/Read_34/ReadVariableOpReadVariableOp2linear/linear_model/payment_type_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	ђ
r
save/Identity_68Identitysave/Read_34/ReadVariableOp"/device:CPU:0*
_output_shapes
:	ђ*
T0
g
save/Identity_69Identitysave/Identity_68"/device:CPU:0*
T0*
_output_shapes
:	ђ
 
save/Read_35/ReadVariableOpReadVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_70Identitysave/Read_35/ReadVariableOp"/device:CPU:0*
_output_shapes

:
*
T0
f
save/Identity_71Identitysave/Identity_70"/device:CPU:0*
_output_shapes

:
*
T0
Ё
save/Read_36/ReadVariableOpReadVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:

q
save/Identity_72Identitysave/Read_36/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:

f
save/Identity_73Identitysave/Identity_72"/device:CPU:0*
_output_shapes

:
*
T0

save/Read_37/ReadVariableOpReadVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_74Identitysave/Read_37/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_75Identitysave/Identity_74"/device:CPU:0*
T0*
_output_shapes

:
 
save/Read_38/ReadVariableOpReadVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_76Identitysave/Read_38/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_77Identitysave/Identity_76"/device:CPU:0*
T0*
_output_shapes

:
Ё
save/Read_39/ReadVariableOpReadVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_78Identitysave/Read_39/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_79Identitysave/Identity_78"/device:CPU:0*
T0*
_output_shapes

:
Њ
save/SaveV2_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*Ь
valueТBПBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBdnn/logits/biasBdnn/logits/kernelB linear/linear_model/bias_weightsB&linear/linear_model/company_xf/weightsB/linear/linear_model/dropoff_latitude_xf/weightsB0linear/linear_model/dropoff_longitude_xf/weightsB+linear/linear_model/payment_type_xf/weightsB.linear/linear_model/pickup_latitude_xf/weightsB/linear/linear_model/pickup_longitude_xf/weightsB-linear/linear_model/trip_start_day_xf/weightsB.linear/linear_model/trip_start_hour_xf/weightsB/linear/linear_model/trip_start_month_xf/weights

save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*­
valueЃB B	100 0,100B3 100 0,3:0,100B70 0,70B100 70 0,100:0,70B48 0,48B70 48 0,70:0,48B34 0,34B48 34 0,48:0,34B1 0,1B34 1 0,34:0,1B1 0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B31 1 0,31:0,1B24 1 0,24:0,1B12 1 0,12:0,1*
dtype0*
_output_shapes
:

save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_41save/Identity_43save/Identity_45save/Identity_47save/Identity_49save/Identity_51save/Identity_53save/Identity_55save/Identity_57save/Identity_59save/Identity_61save/Identity_63save/Identity_65save/Identity_67save/Identity_69save/Identity_71save/Identity_73save/Identity_75save/Identity_77save/Identity_79"/device:CPU:0*"
dtypes
2
Ј
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
р
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
Ј
save/Identity_80Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
_output_shapes
: *
T0
~
save/RestoreV2/tensor_namesConst"/device:CPU:0* 
valueBBglobal_step*
dtype0*
_output_shapes
:
w
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2	

save/AssignAssignglobal_stepsave/RestoreV2*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step
(
save/restore_shardNoOp^save/Assign
­
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*Ь
valueТBПBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBdnn/logits/biasBdnn/logits/kernelB linear/linear_model/bias_weightsB&linear/linear_model/company_xf/weightsB/linear/linear_model/dropoff_latitude_xf/weightsB0linear/linear_model/dropoff_longitude_xf/weightsB+linear/linear_model/payment_type_xf/weightsB.linear/linear_model/pickup_latitude_xf/weightsB/linear/linear_model/pickup_longitude_xf/weightsB-linear/linear_model/trip_start_day_xf/weightsB.linear/linear_model/trip_start_hour_xf/weightsB/linear/linear_model/trip_start_month_xf/weights*
dtype0*
_output_shapes
:

!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*­
valueЃB B	100 0,100B3 100 0,3:0,100B70 0,70B100 70 0,100:0,70B48 0,48B70 48 0,70:0,48B34 0,34B48 34 0,48:0,34B1 0,1B34 1 0,34:0,1B1 0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B1010 1 0,1010:0,1B10 1 0,10:0,1B10 1 0,10:0,1B31 1 0,31:0,1B24 1 0,24:0,1B12 1 0,12:0,1*
dtype0*
_output_shapes
:
щ
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*Ш
_output_shapesЕ
В:d:d:F:dF:0:F0:":0"::"::	ђ:
:
:	ђ:
:
:::*"
dtypes
2
b
save/Identity_81Identitysave/RestoreV2_1"/device:CPU:0*
_output_shapes
:d*
T0
v
save/AssignVariableOpAssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_81"/device:CPU:0*
dtype0
h
save/Identity_82Identitysave/RestoreV2_1:1"/device:CPU:0*
_output_shapes

:d*
T0
z
save/AssignVariableOp_1AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_82"/device:CPU:0*
dtype0
d
save/Identity_83Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes
:F
x
save/AssignVariableOp_2AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_83"/device:CPU:0*
dtype0
h
save/Identity_84Identitysave/RestoreV2_1:3"/device:CPU:0*
_output_shapes

:dF*
T0
z
save/AssignVariableOp_3AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_84"/device:CPU:0*
dtype0
d
save/Identity_85Identitysave/RestoreV2_1:4"/device:CPU:0*
_output_shapes
:0*
T0
x
save/AssignVariableOp_4AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_85"/device:CPU:0*
dtype0
h
save/Identity_86Identitysave/RestoreV2_1:5"/device:CPU:0*
_output_shapes

:F0*
T0
z
save/AssignVariableOp_5AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_86"/device:CPU:0*
dtype0
d
save/Identity_87Identitysave/RestoreV2_1:6"/device:CPU:0*
T0*
_output_shapes
:"
x
save/AssignVariableOp_6AssignVariableOpdnn/hiddenlayer_3/bias/part_0save/Identity_87"/device:CPU:0*
dtype0
h
save/Identity_88Identitysave/RestoreV2_1:7"/device:CPU:0*
T0*
_output_shapes

:0"
z
save/AssignVariableOp_7AssignVariableOpdnn/hiddenlayer_3/kernel/part_0save/Identity_88"/device:CPU:0*
dtype0
d
save/Identity_89Identitysave/RestoreV2_1:8"/device:CPU:0*
_output_shapes
:*
T0
q
save/AssignVariableOp_8AssignVariableOpdnn/logits/bias/part_0save/Identity_89"/device:CPU:0*
dtype0
h
save/Identity_90Identitysave/RestoreV2_1:9"/device:CPU:0*
T0*
_output_shapes

:"
s
save/AssignVariableOp_9AssignVariableOpdnn/logits/kernel/part_0save/Identity_90"/device:CPU:0*
dtype0
e
save/Identity_91Identitysave/RestoreV2_1:10"/device:CPU:0*
_output_shapes
:*
T0

save/AssignVariableOp_10AssignVariableOp'linear/linear_model/bias_weights/part_0save/Identity_91"/device:CPU:0*
dtype0
j
save/Identity_92Identitysave/RestoreV2_1:11"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/AssignVariableOp_11AssignVariableOp-linear/linear_model/company_xf/weights/part_0save/Identity_92"/device:CPU:0*
dtype0
i
save/Identity_93Identitysave/RestoreV2_1:12"/device:CPU:0*
T0*
_output_shapes

:


save/AssignVariableOp_12AssignVariableOp6linear/linear_model/dropoff_latitude_xf/weights/part_0save/Identity_93"/device:CPU:0*
dtype0
i
save/Identity_94Identitysave/RestoreV2_1:13"/device:CPU:0*
_output_shapes

:
*
T0

save/AssignVariableOp_13AssignVariableOp7linear/linear_model/dropoff_longitude_xf/weights/part_0save/Identity_94"/device:CPU:0*
dtype0
j
save/Identity_95Identitysave/RestoreV2_1:14"/device:CPU:0*
T0*
_output_shapes
:	ђ

save/AssignVariableOp_14AssignVariableOp2linear/linear_model/payment_type_xf/weights/part_0save/Identity_95"/device:CPU:0*
dtype0
i
save/Identity_96Identitysave/RestoreV2_1:15"/device:CPU:0*
T0*
_output_shapes

:


save/AssignVariableOp_15AssignVariableOp5linear/linear_model/pickup_latitude_xf/weights/part_0save/Identity_96"/device:CPU:0*
dtype0
i
save/Identity_97Identitysave/RestoreV2_1:16"/device:CPU:0*
_output_shapes

:
*
T0

save/AssignVariableOp_16AssignVariableOp6linear/linear_model/pickup_longitude_xf/weights/part_0save/Identity_97"/device:CPU:0*
dtype0
i
save/Identity_98Identitysave/RestoreV2_1:17"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_17AssignVariableOp4linear/linear_model/trip_start_day_xf/weights/part_0save/Identity_98"/device:CPU:0*
dtype0
i
save/Identity_99Identitysave/RestoreV2_1:18"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_18AssignVariableOp5linear/linear_model/trip_start_hour_xf/weights/part_0save/Identity_99"/device:CPU:0*
dtype0
j
save/Identity_100Identitysave/RestoreV2_1:19"/device:CPU:0*
T0*
_output_shapes

:

save/AssignVariableOp_19AssignVariableOp6linear/linear_model/trip_start_month_xf/weights/part_0save/Identity_100"/device:CPU:0*
dtype0
Л
save/restore_shard_1NoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1""&

summary_op

Merge/MergeSummary:0"ї
model_variablesур
Ћ
/linear/linear_model/company_xf/weights/part_0:04linear/linear_model/company_xf/weights/part_0/AssignClinear/linear_model/company_xf/weights/part_0/Read/ReadVariableOp:0"6
&linear/linear_model/company_xf/weightsђ  "ђ(2Alinear/linear_model/company_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/dropoff_latitude_xf/weights/part_0:0=linear/linear_model/dropoff_latitude_xf/weights/part_0/AssignLlinear/linear_model/dropoff_latitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/dropoff_latitude_xf/weights
  "
(2Jlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zeros:08
л
9linear/linear_model/dropoff_longitude_xf/weights/part_0:0>linear/linear_model/dropoff_longitude_xf/weights/part_0/AssignMlinear/linear_model/dropoff_longitude_xf/weights/part_0/Read/ReadVariableOp:0">
0linear/linear_model/dropoff_longitude_xf/weights
  "
(2Klinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zeros:08
Ф
4linear/linear_model/payment_type_xf/weights/part_0:09linear/linear_model/payment_type_xf/weights/part_0/AssignHlinear/linear_model/payment_type_xf/weights/part_0/Read/ReadVariableOp:0";
+linear/linear_model/payment_type_xf/weightsђ  "ђ(2Flinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/pickup_latitude_xf/weights/part_0:0<linear/linear_model/pickup_latitude_xf/weights/part_0/AssignKlinear/linear_model/pickup_latitude_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/pickup_latitude_xf/weights
  "
(2Ilinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/pickup_longitude_xf/weights/part_0:0=linear/linear_model/pickup_longitude_xf/weights/part_0/AssignLlinear/linear_model/pickup_longitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/pickup_longitude_xf/weights
  "
(2Jlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zeros:08
Ь
6linear/linear_model/trip_start_day_xf/weights/part_0:0;linear/linear_model/trip_start_day_xf/weights/part_0/AssignJlinear/linear_model/trip_start_day_xf/weights/part_0/Read/ReadVariableOp:0";
-linear/linear_model/trip_start_day_xf/weights  "(2Hlinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/trip_start_hour_xf/weights/part_0:0<linear/linear_model/trip_start_hour_xf/weights/part_0/AssignKlinear/linear_model/trip_start_hour_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/trip_start_hour_xf/weights  "(2Ilinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/trip_start_month_xf/weights/part_0:0=linear/linear_model/trip_start_month_xf/weights/part_0/AssignLlinear/linear_model/trip_start_month_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/trip_start_month_xf/weights  "(2Jlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zeros:08

)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign=linear/linear_model/bias_weights/part_0/Read/ReadVariableOp:0"+
 linear/linear_model/bias_weights "(2;linear/linear_model/bias_weights/part_0/Initializer/zeros:08"ѕ
	summariesч
ф
9read_batch_features/file_name_queue/fraction_of_32_full:0
4read_batch_features/fraction_over_9880_of_120_full:0
_read_batch_features/queue/parsed_features/read_batch_features/fifo_queue/fraction_of_100_full:0
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
/dnn/dnn/hiddenlayer_3/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_3/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0
linear/bias:0
!linear/fraction_of_zero_weights:0
'linear/linear/fraction_of_zero_values:0
linear/linear/activation:0"+
trainable_variables++
ь
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_0/kerneld  "d(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_0/biasd "d(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_1/kerneldF  "dF(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/biasF "F(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernelF0  "F0(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias0 "0(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_3/kernel/part_0:0&dnn/hiddenlayer_3/kernel/part_0/Assign5dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_3/kernel0"  "0"(2<dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_3/bias/part_0:0$dnn/hiddenlayer_3/bias/part_0/Assign3dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_3/bias" ""(21dnn/hiddenlayer_3/bias/part_0/Initializer/zeros:08
Щ
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel"  ""(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
Г
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08
Ћ
/linear/linear_model/company_xf/weights/part_0:04linear/linear_model/company_xf/weights/part_0/AssignClinear/linear_model/company_xf/weights/part_0/Read/ReadVariableOp:0"6
&linear/linear_model/company_xf/weightsђ  "ђ(2Alinear/linear_model/company_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/dropoff_latitude_xf/weights/part_0:0=linear/linear_model/dropoff_latitude_xf/weights/part_0/AssignLlinear/linear_model/dropoff_latitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/dropoff_latitude_xf/weights
  "
(2Jlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zeros:08
л
9linear/linear_model/dropoff_longitude_xf/weights/part_0:0>linear/linear_model/dropoff_longitude_xf/weights/part_0/AssignMlinear/linear_model/dropoff_longitude_xf/weights/part_0/Read/ReadVariableOp:0">
0linear/linear_model/dropoff_longitude_xf/weights
  "
(2Klinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zeros:08
Ф
4linear/linear_model/payment_type_xf/weights/part_0:09linear/linear_model/payment_type_xf/weights/part_0/AssignHlinear/linear_model/payment_type_xf/weights/part_0/Read/ReadVariableOp:0";
+linear/linear_model/payment_type_xf/weightsђ  "ђ(2Flinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/pickup_latitude_xf/weights/part_0:0<linear/linear_model/pickup_latitude_xf/weights/part_0/AssignKlinear/linear_model/pickup_latitude_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/pickup_latitude_xf/weights
  "
(2Ilinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/pickup_longitude_xf/weights/part_0:0=linear/linear_model/pickup_longitude_xf/weights/part_0/AssignLlinear/linear_model/pickup_longitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/pickup_longitude_xf/weights
  "
(2Jlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zeros:08
Ь
6linear/linear_model/trip_start_day_xf/weights/part_0:0;linear/linear_model/trip_start_day_xf/weights/part_0/AssignJlinear/linear_model/trip_start_day_xf/weights/part_0/Read/ReadVariableOp:0";
-linear/linear_model/trip_start_day_xf/weights  "(2Hlinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/trip_start_hour_xf/weights/part_0:0<linear/linear_model/trip_start_hour_xf/weights/part_0/AssignKlinear/linear_model/trip_start_hour_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/trip_start_hour_xf/weights  "(2Ilinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/trip_start_month_xf/weights/part_0:0=linear/linear_model/trip_start_month_xf/weights/part_0/AssignLlinear/linear_model/trip_start_month_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/trip_start_month_xf/weights  "(2Jlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zeros:08

)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign=linear/linear_model/bias_weights/part_0/Read/ReadVariableOp:0"+
 linear/linear_model/bias_weights "(2;linear/linear_model/bias_weights/part_0/Initializer/zeros:08"
init_op

group_deps_1"W
ready_for_local_init_op<
:
8report_uninitialized_variables_1/boolean_mask/GatherV2:0"
	eval_step

eval_step:0"њ
metric_variablesх
т
metrics/label/mean/total:0
metrics/label/mean/count:0
metrics/average_loss/total:0
metrics/average_loss/count:0
metrics/accuracy/total:0
metrics/accuracy/count:0
(metrics/precision/true_positives/count:0
)metrics/precision/false_positives/count:0
%metrics/recall/true_positives/count:0
&metrics/recall/false_negatives/count:0
metrics/prediction/mean/total:0
metrics/prediction/mean/count:0
metrics/auc/true_positives:0
metrics/auc/false_negatives:0
metrics/auc/true_negatives:0
metrics/auc/false_positives:0
-metrics/auc_precision_recall/true_positives:0
.metrics/auc_precision_recall/false_negatives:0
-metrics/auc_precision_recall/true_negatives:0
.metrics/auc_precision_recall/false_positives:0
mean/total:0
mean/count:0"яa
cond_contextоaлa
Ѕ
@head/assert_range/assert_less_equal/Assert/AssertGuard/cond_text@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0Ahead/assert_range/assert_less_equal/Assert/AssertGuard/switch_t:0 *й
Khead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency:0
@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0
Ahead/assert_range/assert_less_equal/Assert/AssertGuard/switch_t:0
@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0
щ

Bhead/assert_range/assert_less_equal/Assert/AssertGuard/cond_text_1@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0Ahead/assert_range/assert_less_equal/Assert/AssertGuard/switch_f:0*	
head/ToFloat:0
head/assert_range/Const:0
)head/assert_range/assert_less_equal/All:0
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch:0
Hhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Hhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_0:0
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_1:0
Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/data_3:0
Mhead/assert_range/assert_less_equal/Assert/AssertGuard/control_dependency_1:0
@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0
Ahead/assert_range/assert_less_equal/Assert/AssertGuard/switch_f:0s
)head/assert_range/assert_less_equal/All:0Fhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch:0
@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0@head/assert_range/assert_less_equal/Assert/AssertGuard/pred_id:0e
head/assert_range/Const:0Hhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0Z
head/ToFloat:0Hhead/assert_range/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Х
Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/cond_textThead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0Uhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t:0 *Н
_head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency:0
Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0
Uhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_t:0Ќ
Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0
ђ
Vhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/cond_text_1Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0Uhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f:0*ъ	
head/ToFloat:0
=head/assert_range/assert_non_negative/assert_less_equal/All:0
Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch:0
\head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_0:0
Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_1:0
Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/data_2:0
ahead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/control_dependency_1:0
Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0
Uhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/switch_f:0Ќ
Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0Thead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/pred_id:0n
head/ToFloat:0\head/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
=head/assert_range/assert_non_negative/assert_less_equal/All:0Zhead/assert_range/assert_non_negative/assert_less_equal/Assert/AssertGuard/Assert/Switch:0

=metrics/auc/assert_greater_equal/Assert/AssertGuard/cond_text=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0>metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t:0 *Щ
Hmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency:0
=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0
>metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_t:0~
=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0
П

?metrics/auc/assert_greater_equal/Assert/AssertGuard/cond_text_1=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0>metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f:0*ќ
head/predictions/logistic:0
metrics/auc/Cast/x:0
&metrics/auc/assert_greater_equal/All:0
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch:0
Emetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1:0
Emetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2:0
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_0:0
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_1:0
Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/data_3:0
Jmetrics/auc/assert_greater_equal/Assert/AssertGuard/control_dependency_1:0
=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0
>metrics/auc/assert_greater_equal/Assert/AssertGuard/switch_f:0~
=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0=metrics/auc/assert_greater_equal/Assert/AssertGuard/pred_id:0]
metrics/auc/Cast/x:0Emetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2:0m
&metrics/auc/assert_greater_equal/All:0Cmetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch:0d
head/predictions/logistic:0Emetrics/auc/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1:0
є
:metrics/auc/assert_less_equal/Assert/AssertGuard/cond_text:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0;metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t:0 *К
Emetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency:0
:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0
;metrics/auc/assert_less_equal/Assert/AssertGuard/switch_t:0x
:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0


<metrics/auc/assert_less_equal/Assert/AssertGuard/cond_text_1:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0;metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f:0*а
head/predictions/logistic:0
metrics/auc/Cast_1/x:0
#metrics/auc/assert_less_equal/All:0
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch:0
Bmetrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Bmetrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_0:0
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_1:0
@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/data_3:0
Gmetrics/auc/assert_less_equal/Assert/AssertGuard/control_dependency_1:0
:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0
;metrics/auc/assert_less_equal/Assert/AssertGuard/switch_f:0x
:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0:metrics/auc/assert_less_equal/Assert/AssertGuard/pred_id:0a
head/predictions/logistic:0Bmetrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0\
metrics/auc/Cast_1/x:0Bmetrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0g
#metrics/auc/assert_less_equal/All:0@metrics/auc/assert_less_equal/Assert/AssertGuard/Assert/Switch:0

Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/cond_textNmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0Ometrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t:0 *
Ymetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency:0
Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0
Ometrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_t:0 
Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0
І
Pmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/cond_text_1Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0Ometrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f:0*А
head/predictions/logistic:0
%metrics/auc_precision_recall/Cast/x:0
7metrics/auc_precision_recall/assert_greater_equal/All:0
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch:0
Vmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1:0
Vmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2:0
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_0:0
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_1:0
Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/data_3:0
[metrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/control_dependency_1:0
Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0
Ometrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/switch_f:0u
head/predictions/logistic:0Vmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_1:0
7metrics/auc_precision_recall/assert_greater_equal/All:0Tmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch:0
%metrics/auc_precision_recall/Cast/x:0Vmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/Assert/Switch_2:0 
Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0Nmetrics/auc_precision_recall/assert_greater_equal/Assert/AssertGuard/pred_id:0
§
Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/cond_textKmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0Lmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t:0 *
Vmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency:0
Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0
Lmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_t:0
Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0
ё
Mmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/cond_text_1Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0Lmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f:0*
head/predictions/logistic:0
'metrics/auc_precision_recall/Cast_1/x:0
4metrics/auc_precision_recall/assert_less_equal/All:0
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch:0
Smetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Smetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_0:0
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_1:0
Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/data_3:0
Xmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/control_dependency_1:0
Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0
Lmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/switch_f:0
4metrics/auc_precision_recall/assert_less_equal/All:0Qmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch:0~
'metrics/auc_precision_recall/Cast_1/x:0Smetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_2:0r
head/predictions/logistic:0Smetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/Assert/Switch_1:0
Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0Kmetrics/auc_precision_recall/assert_less_equal/Assert/AssertGuard/pred_id:0"
local_variables

metrics/label/mean/total:0metrics/label/mean/total/Assignmetrics/label/mean/total/read:02,metrics/label/mean/total/Initializer/zeros:0

metrics/label/mean/count:0metrics/label/mean/count/Assignmetrics/label/mean/count/read:02,metrics/label/mean/count/Initializer/zeros:0

metrics/average_loss/total:0!metrics/average_loss/total/Assign!metrics/average_loss/total/read:02.metrics/average_loss/total/Initializer/zeros:0

metrics/average_loss/count:0!metrics/average_loss/count/Assign!metrics/average_loss/count/read:02.metrics/average_loss/count/Initializer/zeros:0

metrics/accuracy/total:0metrics/accuracy/total/Assignmetrics/accuracy/total/read:02*metrics/accuracy/total/Initializer/zeros:0

metrics/accuracy/count:0metrics/accuracy/count/Assignmetrics/accuracy/count/read:02*metrics/accuracy/count/Initializer/zeros:0
Ф
(metrics/precision/true_positives/count:0-metrics/precision/true_positives/count/Assign-metrics/precision/true_positives/count/read:02:metrics/precision/true_positives/count/Initializer/zeros:0
Ш
)metrics/precision/false_positives/count:0.metrics/precision/false_positives/count/Assign.metrics/precision/false_positives/count/read:02;metrics/precision/false_positives/count/Initializer/zeros:0
И
%metrics/recall/true_positives/count:0*metrics/recall/true_positives/count/Assign*metrics/recall/true_positives/count/read:027metrics/recall/true_positives/count/Initializer/zeros:0
М
&metrics/recall/false_negatives/count:0+metrics/recall/false_negatives/count/Assign+metrics/recall/false_negatives/count/read:028metrics/recall/false_negatives/count/Initializer/zeros:0
 
metrics/prediction/mean/total:0$metrics/prediction/mean/total/Assign$metrics/prediction/mean/total/read:021metrics/prediction/mean/total/Initializer/zeros:0
 
metrics/prediction/mean/count:0$metrics/prediction/mean/count/Assign$metrics/prediction/mean/count/read:021metrics/prediction/mean/count/Initializer/zeros:0

metrics/auc/true_positives:0!metrics/auc/true_positives/Assign!metrics/auc/true_positives/read:02.metrics/auc/true_positives/Initializer/zeros:0

metrics/auc/false_negatives:0"metrics/auc/false_negatives/Assign"metrics/auc/false_negatives/read:02/metrics/auc/false_negatives/Initializer/zeros:0

metrics/auc/true_negatives:0!metrics/auc/true_negatives/Assign!metrics/auc/true_negatives/read:02.metrics/auc/true_negatives/Initializer/zeros:0

metrics/auc/false_positives:0"metrics/auc/false_positives/Assign"metrics/auc/false_positives/read:02/metrics/auc/false_positives/Initializer/zeros:0
и
-metrics/auc_precision_recall/true_positives:02metrics/auc_precision_recall/true_positives/Assign2metrics/auc_precision_recall/true_positives/read:02?metrics/auc_precision_recall/true_positives/Initializer/zeros:0
м
.metrics/auc_precision_recall/false_negatives:03metrics/auc_precision_recall/false_negatives/Assign3metrics/auc_precision_recall/false_negatives/read:02@metrics/auc_precision_recall/false_negatives/Initializer/zeros:0
и
-metrics/auc_precision_recall/true_negatives:02metrics/auc_precision_recall/true_negatives/Assign2metrics/auc_precision_recall/true_negatives/read:02?metrics/auc_precision_recall/true_negatives/Initializer/zeros:0
м
.metrics/auc_precision_recall/false_positives:03metrics/auc_precision_recall/false_positives/Assign3metrics/auc_precision_recall/false_positives/read:02@metrics/auc_precision_recall/false_positives/Initializer/zeros:0
T
mean/total:0mean/total/Assignmean/total/read:02mean/total/Initializer/zeros:0
T
mean/count:0mean/count/Assignmean/count/read:02mean/count/Initializer/zeros:0
P
eval_step:0eval_step/Assigneval_step/read:02eval_step/Initializer/zeros:0"!
local_init_op

group_deps_2"э+
	variablesп+м+
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
ь
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_0/kerneld  "d(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_0/biasd "d(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_1/kerneldF  "dF(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/biasF "F(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernelF0  "F0(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias0 "0(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
ь
!dnn/hiddenlayer_3/kernel/part_0:0&dnn/hiddenlayer_3/kernel/part_0/Assign5dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_3/kernel0"  "0"(2<dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform:08
ж
dnn/hiddenlayer_3/bias/part_0:0$dnn/hiddenlayer_3/bias/part_0/Assign3dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_3/bias" ""(21dnn/hiddenlayer_3/bias/part_0/Initializer/zeros:08
Щ
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel"  ""(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
Г
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08
Ћ
/linear/linear_model/company_xf/weights/part_0:04linear/linear_model/company_xf/weights/part_0/AssignClinear/linear_model/company_xf/weights/part_0/Read/ReadVariableOp:0"6
&linear/linear_model/company_xf/weightsђ  "ђ(2Alinear/linear_model/company_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/dropoff_latitude_xf/weights/part_0:0=linear/linear_model/dropoff_latitude_xf/weights/part_0/AssignLlinear/linear_model/dropoff_latitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/dropoff_latitude_xf/weights
  "
(2Jlinear/linear_model/dropoff_latitude_xf/weights/part_0/Initializer/zeros:08
л
9linear/linear_model/dropoff_longitude_xf/weights/part_0:0>linear/linear_model/dropoff_longitude_xf/weights/part_0/AssignMlinear/linear_model/dropoff_longitude_xf/weights/part_0/Read/ReadVariableOp:0">
0linear/linear_model/dropoff_longitude_xf/weights
  "
(2Klinear/linear_model/dropoff_longitude_xf/weights/part_0/Initializer/zeros:08
Ф
4linear/linear_model/payment_type_xf/weights/part_0:09linear/linear_model/payment_type_xf/weights/part_0/AssignHlinear/linear_model/payment_type_xf/weights/part_0/Read/ReadVariableOp:0";
+linear/linear_model/payment_type_xf/weightsђ  "ђ(2Flinear/linear_model/payment_type_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/pickup_latitude_xf/weights/part_0:0<linear/linear_model/pickup_latitude_xf/weights/part_0/AssignKlinear/linear_model/pickup_latitude_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/pickup_latitude_xf/weights
  "
(2Ilinear/linear_model/pickup_latitude_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/pickup_longitude_xf/weights/part_0:0=linear/linear_model/pickup_longitude_xf/weights/part_0/AssignLlinear/linear_model/pickup_longitude_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/pickup_longitude_xf/weights
  "
(2Jlinear/linear_model/pickup_longitude_xf/weights/part_0/Initializer/zeros:08
Ь
6linear/linear_model/trip_start_day_xf/weights/part_0:0;linear/linear_model/trip_start_day_xf/weights/part_0/AssignJlinear/linear_model/trip_start_day_xf/weights/part_0/Read/ReadVariableOp:0";
-linear/linear_model/trip_start_day_xf/weights  "(2Hlinear/linear_model/trip_start_day_xf/weights/part_0/Initializer/zeros:08
б
7linear/linear_model/trip_start_hour_xf/weights/part_0:0<linear/linear_model/trip_start_hour_xf/weights/part_0/AssignKlinear/linear_model/trip_start_hour_xf/weights/part_0/Read/ReadVariableOp:0"<
.linear/linear_model/trip_start_hour_xf/weights  "(2Ilinear/linear_model/trip_start_hour_xf/weights/part_0/Initializer/zeros:08
ж
8linear/linear_model/trip_start_month_xf/weights/part_0:0=linear/linear_model/trip_start_month_xf/weights/part_0/AssignLlinear/linear_model/trip_start_month_xf/weights/part_0/Read/ReadVariableOp:0"=
/linear/linear_model/trip_start_month_xf/weights  "(2Jlinear/linear_model/trip_start_month_xf/weights/part_0/Initializer/zeros:08

)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign=linear/linear_model/bias_weights/part_0/Read/ReadVariableOp:0"+
 linear/linear_model/bias_weights "(2;linear/linear_model/bias_weights/part_0/Initializer/zeros:08"
ready_op


concat:0"M
saversCA
?
save/Const:0save/Identity_80:0save/restore_all (5 @F8"&
losses

head/weighted_loss/Sum:0"
queue_runnersіѓ
с
#read_batch_features/file_name_queue?read_batch_features/file_name_queue/file_name_queue_EnqueueMany9read_batch_features/file_name_queue/file_name_queue_Close";read_batch_features/file_name_queue/file_name_queue_Close_1*
Х
(read_batch_features/random_shuffle_queue4read_batch_features/random_shuffle_queue_EnqueueMany.read_batch_features/random_shuffle_queue_Close"0read_batch_features/random_shuffle_queue_Close_1*
Ф
read_batch_features/fifo_queue&read_batch_features/fifo_queue_enqueue(read_batch_features/fifo_queue_enqueue_1$read_batch_features/fifo_queue_Close"&read_batch_features/fifo_queue_Close_1*"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0)њтб       Щ!й	ёИћџзAч*Т

lossRYA

accuracy_baseline\ЩF?

recall    


aucжc?

prediction/mean1j>

	precision    


label/meanкd>

average_lossЖ[х>

auc_precision_recallЬњ?

accuracy\ЩF?)+ћЋ       C(	=ќџзAч*

checkpoint_pathB B/usr/local/google/home/jyzhao/airflow/data/tfx/pipelines/chicago_taxi_oneshot/Trainer/output/7/serving_model_dir/model.ckpt-999/шЮпб       Щ!й	№5№зAN*Т

lossИДTA

accuracy_baselineоF?

recalljеR>


auc q?

prediction/meanIf>

	precisionюЬ.?


label/mean§d>

average_loss,*Њ>

auc_precision_recall6?

accuracy*M?М|Ў       Цs	A№зAN*

checkpoint_pathB B/usr/local/google/home/jyzhao/airflow/data/tfx/pipelines/chicago_taxi_oneshot/Trainer/output/7/serving_model_dir/model.ckpt-10000W-у