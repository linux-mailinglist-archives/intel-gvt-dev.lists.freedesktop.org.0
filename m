Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730A689B87
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Feb 2023 15:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B4510E04B;
	Fri,  3 Feb 2023 14:26:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5A10E04B;
 Fri,  3 Feb 2023 14:26:24 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313EC6jX010015; Fri, 3 Feb 2023 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=q7liJYzUncL3AKyLjQjPcWYMHH0iXSgpqJKN0MpU4FI=;
 b=BvO/2C04jM+KdRCRB92ICnXSLQQITcAROmU0K10KMbdKXpFOdwA6WXZnruc9tDTwY09R
 5m6O5yvX+9kMEG6fxezhrDrWrA3EKTbWwQHM2t7ViRWFQdui/A8vao57RuZ70GXP1Kk7
 K2P7zTf35r5WBw+flQ6Yr9dK2BplEd2/tmNzjtQDG3Offd/F6EaoA1t4BvSYAmqFclDD
 3haw0ROutNcNS4iXgA5j+fOgkP3r6nykhAj3/dDxWQLmLFnU8B9zhjOjhbsoxmwtOeuu
 DTxpiapQ/ad3KZGrJ/R5dWFBQ9ijfeMCbq87D4fcS9GEp1Aei9IuT/poOhsAv2QGldXH rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh3tq8bna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 14:26:22 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313EQLxx024915;
 Fri, 3 Feb 2023 14:26:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh3tq8bmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 14:26:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313DUIk8008447;
 Fri, 3 Feb 2023 14:26:20 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ncvw39ea5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 14:26:20 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 313EQIVV64946586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Feb 2023 14:26:18 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B569158059;
 Fri,  3 Feb 2023 14:26:18 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 429F358043;
 Fri,  3 Feb 2023 14:26:16 +0000 (GMT)
Received: from [9.65.253.123] (unknown [9.65.253.123])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  3 Feb 2023 14:26:16 +0000 (GMT)
Message-ID: <d322c7d4-9643-a0f4-1575-0cf4c3eb2bc8@linux.ibm.com>
Date: Fri, 3 Feb 2023 09:26:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] vfio: fix deadlock between group lock and kvm lock
Content-Language: en-US
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>
References: <20230202162442.78216-1-mjrosato@linux.ibm.com>
 <DS0PR11MB75295F851A74ACE7CAFB0ACCC3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <DS0PR11MB75295F851A74ACE7CAFB0ACCC3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PoR_GFerNq64v6aRPlKwlphLaRL9OeR7
X-Proofpoint-GUID: d9k1tya9GGzmwfkDZwjVnPu74WbqkhGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_08,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030130
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Christopherson, ,
 Sean" <seanjc@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/3/23 3:58 AM, Liu, Yi L wrote:
> Hi Matthew,
> 
...
>> * Can't pass group->kvm to vfio_device_open, as it references the value
>>   outside of new lock.  Pass device->kvm to minimize changes in this
>>   fix (Alex, Yi)
...
>> @@ -361,7 +420,6 @@ static int vfio_device_first_open(struct vfio_device
>> *device,
>>  	if (ret)
>>  		goto err_module_put;
>>
>> -	device->kvm = kvm;
> 
> Since you've deleted the only usage of kvm pointer in this function, I
> guess you can remove the kvm parameter from vfio_device_open()
> and vfio_device_first_open(). :-) if it makes this patch too big, may
> just have another patch to do it.
> 

Hi Yi,

Yeah, I mentioned it briefly (and vaguely I guess) in the cover, that was intentionally left out to reduce the patch size since this is a fix.  I thought that was the consensus from the v2 comments anyway.

If I end up doing a v4 for this I can just include the removal as a 2nd patch (without a fixes tag) and Alex can squash or keep separate as preferred -- if not you can feel free to do that removal with your cdev follow-up that exploits this work.   

Thanks,
Matt

